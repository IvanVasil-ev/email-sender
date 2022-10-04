# Email Newsletter

Simple fullstack Rails email newsletter app

## Deploy Application:

Be sure if you have Ruby version `3.1.2`.\
Or you can install it with [RVM](https://rvm.io/rvm/install) by the following this commands.
```bash
rvm install 3.1.2
```

Also be sure if you have Rails version `7.0.4` or higher.\
If you do not have it you need to install it with:
```bash
gem install rails
```

If you already have ruby and rails next you need to run command:
```bash
cp .env.example .env
```

Next you need to configure `.env` file with your SQL credentials and then you need to run this commands:
```bash
bundle install
rails db:create
rails db:migrate
```
And then you can start your application with available scripts.

## Available Scripts:

### `bin/dev`

Runs the Rails app in the development mode.\
Open http://localhost:3000 to view it in the browser.

### `rails console`

Runs the Rails app in the terminal mode.\
You can see it in your terminal.

### `rails routes`

Displaying all Rails app routes in the terminal.\
You can add/delete routes in `config/routes.rb`.

### `bundle install`

Installing all gems in `Gemfile` to your Rails app.

### `bundle add <gem_name>`

Adding gem in `Gemfile` and install it.

### `bundle exec rubocop (-A)`

Runs Rubocop linter to display problems in code and auto-fix it with `-A` flag.\
Rubocop configuration file: `.rubocop.yml`.

### `rails db:create`

Creating database with credentials in `config/database.yml`.

### `rails db:migrate`

Runs all migrations in `db/migrations`(migrations will configure database schema).

### `rails db:seed`

Adding start mock data into database.

### `rails db:drop`

Deleting databases from PostgreSQL role.