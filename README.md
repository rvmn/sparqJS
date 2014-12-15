sparqJS
=======

Function to perform a SPARQL request to any endpoint. Using YQL and JSONP in the background.
You can set a variable with the endpoint and re-use it by running it multiple times.

Use:
'''
var req= new Sparq(endpoint,query,callback);
req.run(query,callback) // optional parameters, use either or both
'''
TODO:
- built-in functions, getCLasses/Predicates, base-aggregator-functions, 
- option to use JSON/object based input
- make it connectable to a HTML form, in/out functions
