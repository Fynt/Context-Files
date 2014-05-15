# The base Controller class
#
# @abstract
# @since 0.0.1
module.exports = class Controller

  # @param [Application] application The Application instance
  constructor: (@application) ->

  # Called by the application when dispatching a request.
  #
  # @param [String] action The action you want called.
  # @private
  call_action: (action, request, response) ->
    # Set some values on the controller instance that the action might want to
    # reference.
    @params = request.params
    @request = request
    @response = response

    @["#{action}_action"]()

  # Sets a response header
  #
  # @param [String] field
  # @param [String] value
  header: (field, value) ->
    @response.header field, value

  # Sets the Content-Type header
  #
  # @param [String] value
  content_type: (value) ->
    @header 'Content-Type', value

  # Will write content and send the response
  #
  # @param [Object, String] result The value you want to send.
  respond: (result) ->
    # Make sure we're always ending with a string.
    if result instanceof Object
      @header 'Content-Type', 'application/json'
      result = @json_encode result

    @response.end result

  # Will abort the request and set the status code
  #
  # @param [Integer] code http status code
  abort: (code, message=null) ->
    @response.status(code)
    @response.end()

  # Encodes a value into json.
  #
  # @param [Object] value The value to encode
  # @return [String] json encoded object
  json_encode: (value) ->
    "" + JSON.stringify value
