# E-Commerce API - Documentation

## API Overview

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

```
docker
```

### Setting up locally

#### Step 1: Clone the repository

```
git clone https://github.com/Slightly-Techie/ecommerce-api.git
```

#### Step 2: Generate your local .env file

Create a `.env` file in the root of the project and copy the contents of `.env.example` into it. Besides `POSTGRES_HOST`, you can change the current values in the example file to whatever you want in your `.env` file

#### Step 3: Build the docker image

```sh
docker-compose build
```

This will build the docker image and install all the dependencies. This might take a while depending on your internet connection.

#### Running the application

Steps 4 and 5 are interchangeable, You choose each one depending on how you want to run the application

The port on which the application will be running is `3000`. You can change this in the `docker-compose.yml` file. If you are already running an application on port `3000`, you will have to run your application on a different port or change the port set in the `docker-compose.yml` file

#### Step 4: Start the docker container (if you want to run in the terminal)

- Open a new terminal session
- Navigate to the directory where the project is located
- `cd` into the `ecommerce-api` directory
- Run the command below to start the docker container

```sh
docker-compose up
```

#### Step 5: Start the docker container in the background (if you want to run with docker desktop)

- Open the docker desktop application
- Click on Containers on the left sidebar
- Click on the `ecommerce-api` container
- Click on the play button in the top right corner to start the container
- Go to `localhost:3000` in your browser to view the application

## Documentation
