This is a fork of a devise_example that I quickly modified and stripped down to demonstrate simple authentication system functionality asked for by a job interviewer.

# Below is the README.md for the forked project:

# Devise Example for Rails 4.0.0

Example App using devise. http://github.com/plataformatec/devise

## Installation

Install bundler if you haven't yet:

```
gem install bundler
```

Install the gems:

```
bundle install
```

This will install Rails 4.0.0, sqlite3 gem and Devise.

Rake devise setup task:

```
rake devise:setup
```

This will:

* drop any existing database
* create a new database
* migrate the database
* create a default user and admin

Run the server and use the credentials provided by the rake task to sign in and test the application.

## License

MIT License. Copyright 2010-2013 Plataforma Tecnologia. http://blog.plataformatec.com.br
