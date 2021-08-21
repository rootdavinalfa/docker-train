FROM nginx:1.21.1-alpine

ARG SERVER_PORT
# Declare server port
ENV SERVER_PORT=$SERVER_PORT

# Change listen port to the defined port on environment
RUN cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.orig && \
    sed -i "s/listen[[:space:]]*80;/listen $SERVER_PORT;/g" /etc/nginx/conf.d/default.conf

# Copy index.html to default location of nginx
COPY index.html /usr/share/nginx/html

EXPOSE $SERVER_PORT

RUN echo "Service listened on port ${SERVER_PORT}"

# Entrypoint
CMD ["nginx", "-g", "daemon off;"]
