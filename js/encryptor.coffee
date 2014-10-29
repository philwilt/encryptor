jQuery ($) ->
  Encryptor =
    init: () ->
      if @parseMessageFromUrl()
        $('#encryptor').hide()
        @decrypt()
      else
        $('#decryptor').hide()
        @bindEvents()

    bindEvents: () ->
      $('#encrypt').on "click", @protect.bind(this)

    setMessage: () ->
      @message = $('#message').val()

    getCypher: () ->
      @parseQuery()['message']

    getPassword: () ->
      @password = prompt "Enter your password"

    setUrl: () ->
      @url = window.location + '?message=' + @encrypt()

    replaceMessageWithUrl: () ->
      window.location = @url

    encrypt: () ->
      cypher = CryptoJS.AES.encrypt(@message, @password)
      cypher

    decrypt: () ->
      @getPassword()
      $('#decrypted-message').text(CryptoJS.AES.decrypt(@cypher, @password).toString(CryptoJS.enc.Utf8))

    protect: () ->
      @setMessage()
      @getPassword()
      @setUrl()
      @replaceMessageWithUrl()

    parseMessageFromUrl: () ->
      @cypher = document.URL.split("?message=")[1]

  Encryptor.init()

