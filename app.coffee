express = require "express"

app = express()

app.set "title", "gapp"
app.set "view engine", "jade"

# set public folder
app.use express.static "public"

app.use '/', (req, res)->
  res.send 'gapp build,the beginning'


server = app.listen 3500, () ->

  host = server.address().address
  port = server.address().port

  console.log "listening at http://#{host}:#{port}"
