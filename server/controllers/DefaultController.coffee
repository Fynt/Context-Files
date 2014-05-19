Controller = require '../lib/Controller'

module.exports = class DefaultController extends Controller
  health_check_action: ->
    @respond "HELLO"

  upload_action: ->
    @respond('
    <html>
      <head>
        <title>Upload Test</title>
      </head>
      <body>
        <form action="/file" method="post" enctype="multipart/form-data">
          <input type="file" id="file" name="file">
          <input type="submit" name="submit" value="Upload">
        </form>
      </body>
    </html>')
