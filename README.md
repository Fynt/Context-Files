Schema
======



API
===

It will be assumed that by the time the following functionality is added to Context-Data, that each request will have a user session and/or token to provide permissions around creating and deleting files at the minimum.

API Endpoints
-------------

`POST /file`

Allows you to upload a file, and will return json containing some file metadata.

`GET /file/:id`

Returns json containing some file metadata.

`DELETE /file/:id`

Will delete a file as well as any derived files (such as resized versions in image cache).

`GET /file/show/:id`

Allows us to view files on the front end. Will return the raw file data from the source file, and set the correct Content-Type header.

`GET /file/download/:id`

Image Endpoints
---------------

Allows us to generate download links on the front end. Will return the file data as an attachment with the right Content-Type header.

Images should get resized using a fill method, though an of the following method should let you specify fit=true to make sure the image fits within the dimensions provided, though the final image dimensions may not be exactly the same as the requested parameters.

`GET /image/:width/:height/:file_id.:format`

Will return a resized image, assuming the source file can be converted to an image.

`GET /image/width/:width/:file_id.:format`
`GET /image/height/:height/:file_id.:format`

These routes will resize based on the provided parameter width/height, but will maintain aspect ratio based on the original file.

`GET /image/:crop_origin_x/:crop_origin_y/:width/:height/:file_id.:format

The same as the other resize routes, but provides paramaters for cropping.
