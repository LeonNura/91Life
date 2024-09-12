swagger: "2.0"
info:
  title: Example API
  description: Example API
  version: 1.0.0
host: europe-west1-ninetyone-life-playground.cloudfunctions.net
basePath: /
schemes:
  - https
paths:
  /hello:
    get:
      summary: Example Function
      operationId: exampleFunction
      x-google-backend:
        address: ${hello_address}
      responses:
        200:
          description: OK
  /api:
    get:
      summary: Example Function 2
      operationId: exampleFunction2
      x-google-backend:
        address: ${api_address}
      responses:
        200:
          description: OK