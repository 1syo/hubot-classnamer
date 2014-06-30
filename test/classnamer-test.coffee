Robot = require("hubot/src/robot")
TextMessage = require("hubot/src/message").TextMessage

path = require 'path'
chai = require 'chai'
nock = require 'nock'
expect = chai.expect

describe 'classnamer', ->
  robot = null
  user = null
  adapter = null
  nockScope = null
  envelope = null

  beforeEach (done) ->
    nock.disableNetConnect()
    nockScope = nock('http://www.classnamer.com/').get("/index.txt?generator=generic")
    envelope = { name: 'mocha', room: '#mocha'}
    robot = new Robot null, 'mock-adapter', yes, 'hubot'

    robot.adapter.on 'connected', ->
      require("../src/classnamer")(robot)
      adapter = robot.adapter
      done()
    robot.run()

  it 'call "hubot class me", replay 200', (done) ->
    nockScope.reply 200, 'AutomaticFileBundle\n'

    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).match(/AutomaticFileBundle\n/);
      done()

    adapter.receive new TextMessage(envelope, "hubot class me")

  it 'call "hubot class me", replay 404', (done) ->
    nockScope.reply 404, ""

    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).to.eq("");
      done()

    adapter.receive new TextMessage(envelope, "hubot class me")

  it 'call "hubot class", replay 200', (done) ->
    nockScope.reply 200, 'AutomaticFileBundle\n'

    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).match(/AutomaticFileBundle\n/);
      done()

    adapter.receive new TextMessage(envelope, "hubot class")

  afterEach ->
    nockScope = null
    nock.cleanAll()
    robot.server.close()
    robot.shutdown()
