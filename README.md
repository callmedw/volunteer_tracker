# Volunteer Tracker
## https://github.com/callmedw/volunteer_tracker.git

#### An application to track volunteer projects and the volunteers who work on each project.

#### By Dana Weiss under the watchful eye of EpicodusPDX

## Description
With this application a user will be able to view, add, update, and delete project titles and volunteer names. A user will also be able to add volunteers to a specific project title.


## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
| The program will return the name of current projects. | click "See a list of all projects" | - Dog Walking |
| The program will allow a user to add another project to the list. | click "Add another project" type "Car Wash" | - Car Wash -Dog Walking |
| The program will allow a user to delete a project. | click "Car Wash" click "Delete" | - Dog Walking
| The program will allow a user to update the name of a project. | click "Update this project" type "Dog Washing" | -Dog Washing |
| The program will return the name of current volunteers. | click "See a list of all volunteers" | - Yoshi |
| The program will allow a user to add another volunteer to the list. | click "Add another volunteer" type "Maggie" | - Yoshi -Maggie |
| The program will allow a user to delete a volunteer. | click "Car Wash" click "Delete" | - Maggie
| The program will allow a user to update the name of a volunteer. | click "Update this volunteer" type "Yoshi L." | -Yoshi L. |
| The program will allow a user to add a volunteer to specific volunteer project. | click "Add a volunteer to project" select "Yoshi L." | Yoshi L. has been added to the volunteer project Dog Washing |

## Setup/Installation Requirements

- [ ] Clone this repository
- [ ] Create new branch to make changes to code
- [ ] Open files in atom or text editor of your choice
- [ ] Open in a browser of your choice

## Database Setup Instructions

- [ ] Install PG gem by typing "gem install pg" in to your terminal.
- [ ] Type "bundle" in to your terminal.
- [ ] Type "psql" in to your terminal to open postgres psql.
- [ ] You are now in the default database from here you can create a new database.
- [ ] Type the following statements in psql:

* CREATE DATABASE volunteer_tracker;
* \c volunteer_tracker
* CREATE TABLE "projects" ("id"  SERIAL, "project_title" VARCHAR, PRIMARY KEY ("id"));
* CREATE TABLE "volunteers" ("id"  SERIAL, "volunteer_name" VARCHAR, "project_id" INTEGER, PRIMARY KEY ("id"));

You may also want to create a test database that mirrors the actual database for running tests as you build your program.
To do that type the following statement in psql.

* CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

If you make changes to the original database, volunteer_tracker, you will want to delete your test database and then recreate it with the template of the updated original.

To do this tupe the following statements in psql:
* From the original database, if you are not in the original database navigate to it now using the statement:
* \c volunteer_tracker
now you may delete the test database and then recreate it by typing:
* DROP DATABASE volunteer_tracker_test;
* CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

for other instructions on how to navigate psql visit the documentation here: https://www.postgresql.org/

## Known Bugs

No known bugs.

## Support and contact details

This application is unsupported.

## Technologies Used

HTML, CSS, Ruby, Git, Postgresql, Sinatra, Capybara, Rspec

### License

*open source GPL & MIT*

Copyright (c) 2017 **Dana Weiss**
