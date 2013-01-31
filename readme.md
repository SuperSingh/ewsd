# EWSD v0.1 - A _better_ intranet for the University of Greenwich

## Authors:
__Developers__

	David Smith
	Greg Dowse
	
__Databasing__

	Prabhdeep Birdy
	
__Testing__

	Harveer Singh
	
__Design/UI/UX__

	Troy Blackwood

## Components
* Code Igniter 2.1.3
* MySQLi (Can be migrated to oracle/postgre/etc due to use of active records and query building)

## Non CI directories:
__supportfiles__

Contains relevant content that isn't indluded in the app.
	
__static__

Contains all of the static files that will be included in the head of the document, see the /application/views/layout/header.php for more details

__uploads__

Not implemented yet but will be used to ftp files from client side to the server. References to these files will be stored in the database. The directory structure will work as follows:
	/uploads/[user.id]/[coursework.id]/[filename]


## Config
Check /application/config/database.php and comment/uncomment the appropriate settings for Win/Mac. When commiting to the server make sure to dump the entire MySQLdb as an .sql file. This means when you pull from the server you should imidiately drop the db_ewsd database's contents and reinitialise them from the supportfiles using the appropriate .sql dump.




