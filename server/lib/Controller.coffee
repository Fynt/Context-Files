module.exports = class Controller
  constructor: (@application) ->

  call_action: (action, request, response) ->
    response.end @["#{action}_action"]()
