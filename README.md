# Welcome to the Taco Task Manager

_A platform designed to keep track of the stuff(taco's) you need to manage._

_Unclutter your mind and free your inner 🌮._


The application uses
  - ruby 2.5.3
  - webpack
  - postgresql
  - rspec & capibara for testing
  - rubocop for code quality

How to setup the application
  - please fork & clone the repository
  - navigate in to the project folder
  - in the terminal run: '$ bundle install && yarn install'
    * This will fetch all the projects' ruby and javascript dependencies.
  - in the terminal run: '$ rails db:setup'
    * This will create and migrate the database

How to launch a server
  - in the terminal run: '$ rails server' || '$ rails s'

How to run the tests
  - in the terminal run: '$ rspec'
  - in the terminal run: '$ rake'
    * This option will run both rubocop and the full test suite.

How to run Rubocop
  - in the terminal run: '$ rubocop'

