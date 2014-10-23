expect = require("chai").should()
encryptor = require("encryptor").Encryptor

describe "Encryptor", ->
  it "should have an encrypt function", ->
    enc = new encryptor()
    enc.should.be.a('object')


