##Hair Salon App for BoBo NayNay's

###Author: Erin Collins
###Date: May 8, 2015

##Description
Using Ruby, this application allows the salon owner, BoBo Nay-Nay, to keep track
of stylists and clients at the salon. Each stylist has a name, and each client
has the type of cut they would like, a name, and a stylist.

##User Stories Completed
* As an salon owner, I want to view, add, update and delete stylists.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.

##Databases
* Production database: hair_salon
* Development database: hair_salon_test
* The following tables were used in each database.

Table: stylists

| id | name |
| --- | ---   |
| serial | varchar |

Table: clients

| id | name | type_of_cut | stylist_id |
| --- | --- | --- | --- |
| serial | varchar | varchar | int |

##Setup Instructions  
* Download all files
* Create the Databases described above
* Run bundle install
* Run Ruby app.rb
* Enter localhost:4567 into address bar

he MIT License

Copyright (c) 2015 Erin Collins erincollinsthethird@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
