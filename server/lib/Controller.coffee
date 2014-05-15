module.exports = class Controller

  constructor: (@application) ->

  call_action: (action, request, response) ->
    # Set some values on the controller instance that the action might want to
    # reference.
    @params = request.params
    @request = request
    @response = response

    @["#{action}_action"]()

  respond: (result) ->
    # Make sure we're always ending with a string.
    if result instanceof Object
      result = @json_encode result

    @response.end result

  abort: (code) ->
    @response.status(code)
    @response.end()

  json_encode: (object) ->
    "" + JSON.stringify object
