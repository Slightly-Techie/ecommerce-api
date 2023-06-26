# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Running locally

```bash
docker-compose run e-commerce-api rails db:migrate
CURRENT_UID=1000:1000 docker-compose up
```
