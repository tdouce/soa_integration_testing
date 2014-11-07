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
  echo "1. Open a new tab and cd to the 'client' by executing:"
  echo "   $ cd $CLIENT"
  echo "2. In the 'client' directory, run the 'client' test suite by executing:"
  echo "   $ DEP_SERVICES=auto_start bundle exec rspec"
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

