# Local development Dockerfile for WordPress
# Adds msmtp to route PHP mail() to MailHog and some handy tools for dev.
FROM wordpress:latest

# Install msmtp (lightweight sendmail alternative) and useful tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       msmtp msmtp-mta ca-certificates less nano curl nodejs npm sudo \
    && rm -rf /var/lib/apt/lists/*

# Copy msmtp config and PHP override to use msmtp as sendmail
COPY msmtprc /etc/msmtprc
RUN chmod 600 /etc/msmtprc && chown www-data:www-data /etc/msmtprc

# Configure PHP to use msmtp sendmail wrapper
COPY php-msmtp.ini /usr/local/etc/php/conf.d/zz-msmtp.ini
# Ensure msmtp logfile exists and is writable by www-data
RUN touch /var/log/msmtp.log && chown www-data:www-data /var/log/msmtp.log

RUN chown -R www-data:www-data /var/www/html

# Default working directory is the WP root
WORKDIR /var/www/html

# Healthcheck for quick feedback
HEALTHCHECK --interval=30s --timeout=5s --retries=5 CMD curl -f http://localhost/wp-login.php || exit 1
