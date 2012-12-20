# Overview
An API can be used to integrate a RefineryCMS Extension with a 3rd party application that is 
hosted in a different domain. HTTP Basic Authentication can be added to an Extension's front-end 
controller to protect the api (note that the username and password will be sent in clear text so
an SSL certificate should be used).


## Commands Used to Generate RefineryCMS Extension
1. rails generate refinery:engine event title:string description:string
2. bundle install
3. rails generate refinery:events
4. rake db:migrate
5. rake db:seed


## API Routes
This basic RefineryCMS Extension only uses a single resource `events`. If your Extension has 
multiple resources you should put some more thought into your url structure.


## JSONP Support
The HTTP GET requests support jsonp which allows for cross-domain requests. To use jsonp you 
must use the .js extension and append `?callback=?` to the end of the url. Ex:
```javascript
$.getJSON("http://localhost:3000/events/integration/api.js?callback=?", function(data) {
  console.log(data);
});​
```


## Testing the REST API w/ Curl 
* i – show response headers
* X – pass a HTTP method name
* d – pass in parameters enclosed in quotes


### GET (completely public - no authentication required)
* curl -i -X GET http://localhost:3000/events/integration/api
* curl -i -X GET http://localhost:3000/events/integration/api/1

### POST
* curl -i -X POST -u admin:secret -d "event[title]=test+event+2&event[description]=desc+text" 
http://localhost:3000/events/integration/api

### PUT
* curl -i -X PUT -u admin:secret -d "event[description]=updated+desc+text" 
http://localhost:3000/events/integration/api/1

### Delete
* curl -i -X DELETE -u admin:secret http://localhost:3000/events/integration/api/1
