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

or with Github CLI

```
gh repo clone Slightly-Techie/ecommerce-api
```

#### Step 2: Generate your local .env file

Create a `.env` file in the root of the project and copy the contents of `.env.example` into it. Keep the same values from the example file in your .env. You'll only need to update the value of the `RAILS_MASTER_KEY` which is empty at the moment. Follow step 3 to see how.

#### Step 3: Generate a new `master.key` and `credentials.yml.enc` file

run the command below generate a new `master.key` and `credentials.yml.enc` file in the `config` directory

```sh
EDITOR="code --wait" bin/rails credentials:edit
```

You can use nano if you are running on linux, mac or windows wsl

```sh
EDITOR="nano --wait" bin/rails credentials:edit
```

After running the command above, a new `master.key` file will be generated in the `config` directory. Copy the contents of the file and paste it as the value of the `RAILS_MASTER_KEY` variable in the `.env` file.

If the above command generates both a `master.key` and a `credentials.yml.enc` file, you can skip the next step.

If it doesn't, and just generates a `master.key` file, run the command below to generate a new `credentials.yml.enc` file

```sh
EDITOR=code rails credentials:edit
```

#### Step 4: Build the docker image

```sh
docker-compose build
```

This will build the docker image and install all the dependencies. This might take a while depending on your internet connection.

#### Running the application

Steps 5 and 6 are interchangeable, You choose each one depending on how you want to run the application

The port on which the application will be running is `3000`. You can change this in the `docker-compose.yml` file. If you are already running an application on port `3000`, you will have to run your application on a different port or change the port set in the `docker-compose.yml` file

#### Step 5: Start the docker container (if you want to run in the terminal)

- Open a new terminal session
- Navigate to the directory where the project is located
- `cd` into the `ecommerce-api` directory
- Run the command below to start the docker container

```sh
docker-compose up
```

#### Step 6: Start the docker container in the background (if you want to run with docker desktop)

- Open the docker desktop application
- Click on Containers on the left sidebar
- Click on the `ecommerce-api` container
- Click on the play button in the top right corner to start the container
- Go to `localhost:3000` in your browser to view the application

## Documentation
