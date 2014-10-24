class Encryptor
  setMessage: () ->

  getPassword: () ->

  setUrl: () ->

  replaceMessageWithUrl: () ->

  encrypt: () ->
    cypher = CryptoJS.AES.encrypt(@message, @password)
    console.log "Verified: " + CryptoJS.AES.decrypt(cypher, @password).toString(CryptoJS.enc.Utf8)
    cypher

  protect: () ->
    @setMessage()
    @getPassword()
    @setUrl()
    @replaceMessageWithUrl()

exports.Encryptor = Encryptor
