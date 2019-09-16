# Welcome to shypple import API

## DOCUMENTATION

This API allows you to:

 - Authorized users can  import a CSV file, with ports 
 - View imported ports
 - Search through ports in a various ways
 - Create new admins allowed to import ports
 - Given the correct admin username and password, view the special authentication token to import CSV files.
 
 This app uses the  gem 'simple_token_authentication' to generate unique tokens per user.

 ## How to use the api

 # Search

Either clone the repository, start the rails server, or, open "https://shyppleapi.herokuapp.com/api/v1/ports"

Upon opening the api you will be greeted to all the ports entries in the database.
In order to Search for preform a GET request with your favourite tool, placing the key you would like to search for, and the value you want to find associated to this key.

Keys that are currently functional:
"name, code, city, oceaninsightscode, latitude, longitude, bigschedules, createdat, updatedat, porttype, hubport, oceaninsights,"

The empty fields in the json file were left intentionally, in order to provide future functionality, if needed.

#Import

Navigate to "https://shyppleapi.herokuapp.com/api/v1/admins" where you can make a POST request, with the keys "username, password", that you can set to the values you want.

After completing this step you will need to check your special authentication token, in case you missed it when creating your account.
On the same API endpoint, preform a GET request, with your username and password as keys, and their values, obtaining the your "authentication_token"

In order to import a file, you can either create a user, or use 2 of the pre-existing adminds from the system.

  username:"JoaoLobo",
  password:"12345"
  authentication_token: "preform the GET request as displayed on the last step"

  username:"SHYPPLE",
  password:"12345"
  authentication_token: "preform the GET request as displayed on the last step"

Now you have your user account and your special authentication_token, all its left for you to do, is go back to "https://shyppleapi.herokuapp.com/api/v1/ports", preform a POST request where the keys should look like this:

  username: "your username"
  password: "your password"
  authentication_token: "your authentication token"
  port: "your csv file that you wish to import"

If import sucessfull you should see an entry of the imported file, otherwise and error will be displayed.

Thanks for using!
