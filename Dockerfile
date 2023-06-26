FROM ruby:3.2.2-bullseye

WORKDIR /app

# Add a user with the same name as the running user so that we do not have to specify 'username' in database.yml
ARG USER
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $USER && useradd -r -m -u $UID -g $GID $USER

# As the root user, give the user access to the working directory
RUN chown -R $USER /app
#RUN mkdir -m 777 /usr/local/nvm

USER $USER

#COPY --chown=$USER package.json package-lock.json .npmrc ./
# Need NPM_TOKEN at image build time, which is different than other environment files
# which are needed at container run time
# ARG NPM_TOKEN
# ENV NPM_TOKEN=${NPM_TOKEN}

# Install nodejs and npm packages
# ENV NVM_DIR /usr/local/nvm
# RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | /bin/bash
# COPY --chown=$USER .nvmrc ./
# RUN bash -c 'source "$NVM_DIR/nvm.sh" ; nvm install'
# ENV PATH="${PATH}:${NVM_DIR}/versions/node/v8.11.1/bin"
# RUN npm install

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY --chown=$USER Gemfile Gemfile.lock ./
# COPY --chown=$USER vendor/gems vendor/gems

# Get username and password from LastPass

RUN gem install bundler -v $(tail -n1 Gemfile.lock)
RUN bundle install

# We need foreman to execute all sidekiq queues
# COPY --chown=$USER .foreman ./
# RUN gem install foreman

# Add a script to be executed every time the container starts to remove the pid file that rails leaves behind: https://docs.docker.com/compose/rails/
COPY --chown=$USER docker/entrypoint.sh ./docker/

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
