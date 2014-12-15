class Sparq
  constructor: (endp,@query,@cb) ->
    @endp=typeof(endp) is 'string'&&endp||'http://dbpedia.org/sparql/'

  run : (query,cb) ->

    # validations & defaults
    @query=typeof(query) is 'string'&&query||typeof(@query) is 'string'&&@query||'SELECT * WHERE{$s $p $o}LIMIT 10'
    @cb = typeof(cb) is 'function'&&cb||typeof(@cb) is 'function'&&@cb||(r)-> console.log('SemQuery, no callback defined. Result:',r)

    # submit request
    req = 'use "http://triplr.org/sparyql/sparql.xml" as sparql;'+
    'select * from sparql where query="'+@query+
    '" and service="'+@endp+'"';
    scriptEl = document.createElement("script")
    uid = "yql" + +new Date()
    encodedQuery = encodeURIComponent(req.toLowerCase())
    instance = this
    window.SparqLib?={}

    # store JSONP callback
    SparqLib[uid] = (json) ->
      instance.cb(json);
      delete SparqLib[uid];
      document.body.removeChild(scriptEl);
      return
      
    # start JSONP request
    scriptEl.src = "http://query.yahooapis.com/v1/public/yql?q=" + encodedQuery + "&format=json&callback=SparqLib." + uid
    document.body.appendChild scriptEl
    return
