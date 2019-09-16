# Welcome to shypple import API


## DOCUMENTATION


This API allows you to:


- Authorized users can import a CSV file, with ports

- View imported ports

- Search through ports in various ways

- Create new admins allowed to import ports

- Given the correct admin username and password, view the special authentication token to import CSV files.

This app uses the gem 'simple_token_authentication' to generate unique tokens per user.


## How to use the API


## Search


Either clone the repository, start the rails server, or, open "https://shyppleapi.herokuapp.com/api/v1/ports"


Upon opening the api you will be greeted to all the ports entries in the database.

In order to Search for preform a GET request with your favorite tool, placing the key you would like to search for, and the value you want to find associated with this key.


Keys that are currently functional:

"name, code, city, oceaninsightscode, latitude, longitude, bigschedules, createdat, updatedat, porttype, hubport, oceaninsights,"


The empty fields in the JSON file were left intentionally, in order to provide future functionality, if needed.


##Import


Navigate to "https://shyppleapi.herokuapp.com/api/v1/admins" where you can make a POST request, with the keys "username, password", that you can set to the values you want.


After completing this step you will need to check your special authentication token, in case you missed it when creating your account.

On the same API endpoint, perform a GET request, with your username and password as keys, and their values, obtaining the your "authentication_token"


In order to import a file, you can either create a user or use 2 of the pre-existing admins from the system.


username:"JoaoLobo",

password:"12345"

authentication_token: "preform the GET request as displayed on the last step"


username:"SHYPPLE",

password:"12345"

authentication_token: "preform the GET request as displayed on the last step"


Now you have your user account and your special authentication_token, all it's left for you to do is go back to "https://shyppleapi.herokuapp.com/api/v1/ports", perform a POST request where the keys should look like this:


username: "your username"

password: "your password"

authentication_token: "your authentication token"

port: "your csv file that you wish to import"


If import successful you should see an entry of the imported file, otherwise and error will be displayed.

##Notice

Since the API is currently with free hosting, it might take a while to bootup the website/import files, specialy if data entries are very big.


Thanks for using!



