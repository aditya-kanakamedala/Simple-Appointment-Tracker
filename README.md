# Simple-Appointment-Tracker

This is a simple application to create and search appointments. The application supports creation of appointments from a web interface implemented using HTML, CSS, JavaScript, JQuery, and Bootstrap.

I've intentionally kept it the most minimal possible while introducing some separation of concerns.

## Pre-requisites

MAMP for Window or Mac or Unix
Perl runtime with global permissions
Project Organization

1.*db* - database configuration file containing database name ,username, password.  
2. *scripts* - scripts to handle form submission.  
3. *static->js* - contains the java script sources for the webpages.  
4. *static->styles* - contains the stylesheets templates - html template files are put in this folder.  

## Database Schema

The database consists of a single table appointments containing the following columns:  
  
| Column Name   | Column Type   |  
| :-----------: |:-------------:|  
| Date          | date          |  
| Time          | text          |  
| Description   |  text         |  

## Running Instructions

1. Install MAMP distribution if you have not installed already.
2. MAMP comes pre-configured apache server, mysql database server and phpmyadmin, which will be used in the next steps.
3. Place the root folder "appointments" in the cgi-bin folder of apache server.
4. Now, open phpmyadmin and create a database "appointments" and a table "appointments" using the above schema.
5. Alternatively, you can choose different database and table names; in the case that you do so, make sure to update them in db_credentials.pl file inside db folder.
6. In the browser, enter the URL http://localhost/appointments.
7. The application should be live.
