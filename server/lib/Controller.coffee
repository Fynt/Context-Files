# The base Controller class
#
# @since 0.0.0
module.exports = class Controller

  # @param [Application] application The Application instance
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

  # Will abort the request and set the status code
  #
  # @param [Integer] code http status code
  abort: (code) ->
    @response.status(code)
    @response.end()

  # @param [Object] value The value to encode
  # @return [String] json encoded object
  json_encode: (value) ->
    "" + JSON.stringify value
