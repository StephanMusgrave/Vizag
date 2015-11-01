# SolIndia

## Deployment:
$  git remote add development https://git.heroku.com/solindia-development.git
```sh
$  git push development [development:master]
```
$  heroku run rake db:migrate
$  open  https://solindia-development.herokuapp.com

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
