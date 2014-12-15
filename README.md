#sparqJS
=======

Function to perform a SPARQL request to any endpoint. Using YQL and JSONP in the background.
You can set a variable with the endpoint and re-use it by running it multiple times.

##Example

```javascript
var req= new Sparq('http://dbpedia.org/sparql','SELECT * WHERE {$s $p $o}LIMIT 10',function(e){alert(e)}); 
//Sparq= @params: (endpoint,query[optional],callback[optional])
req.run('PREFIX owl: SELECT * WHERE {$s a owl:Class}LIMIT 10',function(e){$('#res').html(e)}) 
//run= @params: (query[optional],callback[optional])
```

##TODO:
- built-in functions, getCLasses/Predicates, base-aggregator-functions, 
- option to use JSON/object based input
- make it connectable to a HTML form, in/out functions
