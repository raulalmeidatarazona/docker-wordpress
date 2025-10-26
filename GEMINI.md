# Project Overview

This project provides a local development environment for WordPress using Docker. It consists of four main services defined in the `docker-compose.yml` file:

*   **`db`**: A MariaDB database service to store WordPress data.
*   **`wordpress`**: The WordPress application itself, running on a custom Docker image.
*   **`mailhog`**: A local mail server to capture and view emails sent from WordPress.
*   **`wpcli`**: A service providing the WordPress Command-Line Interface (WP-CLI) for managing the WordPress installation.

The environment is configured to be easily customizable through environment variables and the `docker-compose.yml` file.

# Building and Running

To build and run the project, you will need Docker and Docker Compose installed.

1.  **Build the Docker images:**

    ```bash
    docker-compose build
    ```

2.  **Start the services:**

    ```bash
    docker-compose up -d
    ```

3.  **Access the WordPress site:**

    Once the services are running, you can access the WordPress site at [http://localhost:8001](http://localhost:8001).

4.  **Access MailHog:**

    You can access the MailHog web interface to view emails at [http://localhost:8025](http://localhost:8025).

5.  **Use WP-CLI:**

    To use WP-CLI, you can execute commands within the `wpcli` service:

    ```bash
    docker-compose exec wpcli wp <command>
    ```

    For example, to list the installed plugins:

    ```bash
    docker-compose exec wpcli wp plugin list
    ```

# Development Conventions

*   **Database:** The database credentials are set in the `docker-compose.yml` file as environment variables for the `db` and `wordpress` services.
*   **Email:** All emails sent from WordPress are captured by MailHog.
*   **WordPress Configuration:** The `wp-config.php` file is configured to read database and other settings from environment variables.
*   **Custom WordPress Image:** The `docker/Dockerfile` is used to build a custom WordPress image with `msmtp` for email routing and other development tools.
