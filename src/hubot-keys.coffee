# Description
#   Store users' public SSH keys in Hubot
#
# Commands:
#   hubot my public key is <public_ssh_key> - Stores the user's public SSH key.
#   hubot what is (my|<username>) public key - Returns the user's public SSH key.
#   hubot (delete|remove|forget) my public key - Removes the user's public SSH key.
#
# Notes:
#   * Call the method `robot.keys.keyForUserName(<usernamename>)` or `robot.keys.keyForUserId(<userId>)`
#   * to get a user's public key from other scripts.
#
# Author:
#   contolini

module.exports = (robot) ->

  class Keys

    keyForUserName: (name) ->
      user = robot.brain.userForName name
      user.key

    keyForUserId: (id) ->
      user = robot.brain.userForId id
      user.key

    addKeyForUserName: (name, key) ->
      user = robot.brain.userForName name
      user.key = key
      user.key

    addKeyForUserId: (id, key) ->
      user = robot.brain.userForId id
      user.key = key
      user.key

    deleteKeyForUserName: (name, key) ->
      user = robot.brain.userForName name
      delete user.key
      user

    deleteKeyForUserId: (id, key) ->
      user = robot.brain.userForId id
      delete user.key
      user

  robot.keys = new Keys

  robot.respond /my public (ssh )?key is (.*)/i, (res) ->
    key = res.match[2]
    if !/ssh-rsa AAAA[0-9A-Za-z+\/]+[=]{0,3}( [^@]+@[^@]+)?/.test(key)
      return res.send "`#{key}` is not a valid public SSH key. You can find your key with `cat ~/.ssh/id_rsa.pub`."
    robot.keys.addKeyForUserName res.envelope.user.name, key
    res.send "Okay, I stored your public SSH key as #{key.substring(0, 40)}..."

  robot.respond /(what is |show )?([^\s]+)('s?)? public (ssh )?key$/i, (res) ->
    user = res.match[2]
    console.log user
    if user == 'my'
      user = res.envelope.user.name
    key = robot.keys.keyForUserName user
    if !key
      return res.send "I don't know #{user}'s public SSH key. Add it with `#{robot.name} my public key is <key>`. You can find your key with `cat ~/.ssh/id_rsa.pub`."
    message = "```\n# #{robot.brain.userForName(user).email_address}\n#{key}\n```"
    res.send message

  robot.respond /(delete|remove|forget) my public (ssh )?key$/i, (res) ->
    key = robot.keys.keyForUserId res.envelope.user.id
    if !key
      return res.send "I don't know your public SSH key. I can't forget something I don't know."
    robot.keys.deleteKeyForUserId res.envelope.user.id
    res.send "Okay, I removed your public SSH key."
