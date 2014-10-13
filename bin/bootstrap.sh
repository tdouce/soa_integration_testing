#!/bin/sh

success=0

echo ""
echo "preparing 'home' application"
echo ""
cd home/
bundle
let success=success+$?
bundle exec rake db:drop:all
let success=$?+success
RAILS_ENV=test bundle exec rake db:setup
let success=$?+success
bundle exec rake db:setup
let success=$?+success

echo ""
echo "preparing 'home_2' application"
echo ""
cd ../home_2/
bundle
let success=success+$?
bundle exec rake db:drop:all
let success=$?+success
RAILS_ENV=test bundle exec rake db:setup
let success=$?+success
bundle exec rake db:setup
let success=$?+success

echo ""
echo "preparing 'client' application"
echo ""
cd ../client/
bundle

cd ../

HOME_1=$PWD/home
HOME_2=$PWD/home_2
CLIENT=$PWD/client

function run_tests {
  echo "1. Open a new tab from the command line."
  echo "2. In that tab, cd to 'home' application and start 'home' application's server on port '3000' in 'test' environment by executing:"
  echo "   $ cd $HOME_1 && bundle exec rails server --environment=test --pid=$HOME_1/tmp/pids/home-test.pid --port=3000"
  echo "3. Open a new tab from the command line."
  echo "4. In that tab, cd to 'home_2' directory and start 'home_2' application's server on port '4000' in 'test' environment by executing:"
  echo "   $ cd $HOME_2 && bundle exec rails server --environment=test --pid=$HOME_2/tmp/pids/home-test.pid --port=4000"
  echo "5. Open a new tab from the command line."
  echo "6. In that tab, cd to the 'client' application and run the 'client' application's test suite by executing:"
  echo "   $ cd $CLIENT && bundle exec rspec"
}

printf "\e[36m"
echo ""
echo "==========================================="
echo ""

if [[ "$success" -ne "0" ]]
then
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo "I couldn't setup your applications for you:("
  echo "Manual steps are required to finish the setup process."
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo ""
  echo "Once you have setup your applications:"
  echo ""
  run_tests
else
  echo "I have successfully setup your applications!"
  echo ""
  run_tests
fi

echo ""
echo "==========================================="
echo ""
printf "\e[0m"

