# Custom Dockerfile for Nginx

FROM nginx:1.7

# Remove the default configuration files
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/conf.d/example_ssl.conf

# Set up a symlink for the Angular code
RUN ln -s /usr/src/app/dist /usr/share/nginx/html/dashboard

# Add TweetCheck certificates
COPY certs/ssl-bundle.crt /etc/ssl/ssl-bundle.crt
COPY certs/tweetcheck.key /etc/ssl/tweetcheck.key

# Add nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy in latest source code
COPY html /usr/share/nginx/html

EXPOSE 80 443
