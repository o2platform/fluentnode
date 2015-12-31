
@.**http_POST**

    String::http_POST = (req_Data, callback) ->
      options =
        method: 'POST'
        data: req_Data
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(req_Data,'utf8')

      @.http_With_Options options, callback

@.**POST**

    String::POST = (req_Data, callback) ->
      @.http_POST req_Data, (error, data, res)-> callback(data)

