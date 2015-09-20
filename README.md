# SolIndia

## Deployment:
$  git remote add development https://git.heroku.com/solindia-development.git
$  git push development development:master
$  heroku run rake db:migrate
$  open  https://solindia-development.herokuapp.com