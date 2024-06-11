# Use the official Kong Docker image
FROM kong:2.8.1

# Set the working directory
WORKDIR /app

# Copy the configuration file
COPY kong.yml .

# Set environment variables
ENV KONG_DATABASE="off" \
    KONG_DECLARATIVE_CONFIG="/app/kong.yml" \
    KONG_DNS_ORDER="LAST,A,CNAME" \
    KONG_PLUGINS="request-transformer,cors,key-auth,acl,basic-auth" \
    KONG_NGINX_PROXY_PROXY_BUFFER_SIZE="160k" \
    KONG_NGINX_PROXY_PROXY_BUFFERS="64 160k"\
    SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE4MDUxNDAwLAogICJleHAiOiAxODc1ODE3ODAwCn0.eu_a_0KlFWVpekdJMx-YzhSMKFLO65tylGlErrprtAU"\
    SUPABASE_SERVICE_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogInNlcnZpY2Vfcm9sZSIsCiAgImlzcyI6ICJzdXBhYmFzZSIsCiAgImlhdCI6IDE3MTgwNTE0MDAsCiAgImV4cCI6IDE4NzU4MTc4MDAKfQ.QkOxd_AjZPpCQYZizHS79uMAgmGk-nUybw5jYTVTuJ4"\
    DASHBOARD_USERNAME="tank_admin"\
    DASHBOARD_PASSWORD="voF4CXb7ONQwYw3iuiXERh64wLeNw2gY"

# Expose ports
EXPOSE 8000

# Start Kong with the provided configuration
ENTRYPOINT ["bash", "-c", "echo \"$(cat /app/kong.yml)\" > /home/kong/kong.yml && /docker-entrypoint.sh kong docker-start"]