# Rogikenista

Staff info manager with web interface.

## Install / Run

Install:

```
$ git clone (this repository)
$ cd rogikenista
$ bundle install --path vendor/bundle
$ cp database.yml.sample database.yml
```

### Run in development environment
Reset database:

```
$ bundle exec rake db:migrate:reset db:seed
```

Run:

```
$ bundle exec rerun app.rb
```
