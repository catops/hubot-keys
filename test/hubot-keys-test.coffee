chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hubot-keys', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
      brain:
        userForId: sinon.spy()

    require('../src/hubot-keys')(@robot)

  it 'registers a respond listener for setting key', ->
    expect(@robot.respond).to.have.been.calledWith(/my public (ssh )?key is (.*)/i)

  it 'registers a respond listener for retrieving key', ->
    expect(@robot.respond).to.have.been.calledWith(/(what is |show )?([^\s]+)('s?)? public (ssh )?key$/i)

  it 'registers a respond listener deleting key', ->
    expect(@robot.respond).to.have.been.calledWith(/(delete|remove|forget) my public (ssh )?key$/i)
