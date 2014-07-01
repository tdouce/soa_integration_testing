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
echo "preparing 'client' application"
echo ""
cd ../client/
bundle

cd ../

HOME=$PWD/home
CLIENT=$PWD/client

function run_tests {
  echo "1. cd to 'home' directory by executing:"
  echo "   $ cd $HOME"
  echo "2. Start 'home' application's server on port '3000' in 'test' environment by executing:"
  echo "   $ bundle exec rails server --environment=test --pid=$HOME/tmp/pids/home-test.pid --port=3000"
  echo "3. Open a new tab and cd to the 'client' by executing:"
  echo "   $ cd $CLIENT"
  echo "4. In the 'client' directory, run the 'client' test suite by executing:"
  echo "   $ bundle exec rspec"

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

