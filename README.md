# WordPress Development Environment with Docker and _tw

This project provides a local development environment for WordPress using Docker, with the [_tw](https://underscoretw.com/) starter theme included for rapid theme development with Tailwind CSS.

## Overview

The environment is composed of the following services, defined in the `docker-compose.yml` file:

*   **`db`**: A MariaDB database service.
*   **`wordpress`**: The WordPress application, built from a custom Dockerfile.
*   **`mailhog`**: A local mail server to intercept and view emails sent from WordPress.
*   **`wpcli`**: A service with the WordPress Command-Line Interface (WP-CLI) for managing the WordPress installation.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

*   [Docker](https://www.docker.com/get-started)
*   [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

Follow these steps to get the project up and running:

1.  **Clone the repository:**

    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2.  **Build the Docker images:**

    ```bash
    make build
    ```

3.  **Start the services:**

    ```bash
    make up
    ```

4.  **Access the WordPress site:**

    Once the services are running, you can access your WordPress site at [http://localhost:8001](http://localhost:8001).

5.  **Access MailHog:**

    You can access the MailHog web interface to view emails at [http://localhost:8025](http://localhost:8025).

## Usage

This project includes a `Makefile` with commands to simplify the management of the Docker environment:

*   `make up`: Start the services in detached mode.
*   `make down`: Stop the services.
*   `make build`: Build the Docker images.
*   `make logs`: Follow the logs of the services.
*   `make wp`: Execute WP-CLI commands. For example, to list the installed plugins, you can run `make wp plugin list`.
*   `make dev`: One-shot command that builds images, starts services, installs theme dependencies, and launches the theme dev server.

## Theme Development

The [_tw](https://underscoretw.com/) starter theme, named `gemini-theme`, is located in the `wp_data/wp-content/themes/gemini-theme` directory. To start developing your theme, you need to install the dependencies and run the development server.

1.  **Install theme dependencies:**

    ```bash
    make wp-install
    ```

2.  **Start the development server:**

    ```bash
    make wp-dev
    ```

This will watch for changes in your theme files and automatically rebuild the assets.

## Directory Structure

```
.
├── docker-compose.yml
├── .idea/
├── db_data/
├── docker/
│   ├── Dockerfile
│   ├── msmtprc
│   └── php-msmtp.ini
└── wp_data/
    ├── wp-admin/
    ├── wp-content/
    │   ├── themes/
    │   │   └── gemini-theme/
    │   └── ...
    └── wp-includes/
```
