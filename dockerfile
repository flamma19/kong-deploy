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
    KONG_NGINX_PROXY_PROXY_BUFFERS="64 160k"

# Expose ports
EXPOSE 8000

# Start Kong with the provided configuration
ENTRYPOINT ["bash", "-c", "echo \"$(cat /app/kong.yml)\" > /home/kong/kong.yml && /docker-entrypoint.sh kong docker-start"]