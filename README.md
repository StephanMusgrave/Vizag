# SolIndia

## Deployment:
$  git remote add development https://git.heroku.com/solindia-development.git
```sh
$  git push development master
```
$  heroku run rake db:migrate --app solindia-development
$  open  https://solindia-development.herokuapp.com

git remote add test https://git.heroku.com/solindia-test.git
git push test development:master

<!-- to run a database migration on the solindia-test app -->
heroku run rake db:migrate --app solindia-test

<!-- to reset the database and load example data from seeds.rb -->
heroku run rake db:reset --app solindia-test

$  open  https://solindia-test.herokuapp.com

## Setup:
$  bin/rails generate paperclip listing image
$  bin/rails generate migration AddPriceToListing price_euro:integer price_dollar:integer price_gbp:integer

$  rails generate devise:install
$  rails g devise:views
$  rails generate devise User
$  bin/rake db:migrate

$ bin/rails g model image_container name:string
$ bin/rails g paperclip image_container picture

$  bin/rails g active_admin:install
$  bin/rake db:migrate
$  bin/rails generate active_admin:resource Listing
