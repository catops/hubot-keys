# Description
#   Store users' public SSH keys in Hubot
#
# Commands:
#   hubot my public key is <public_ssh_key> - Stores the user's public SSH key.
#   hubot what is my public key - Returns the user's public SSH key.
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   contolini

module.exports = (robot) ->

  robot.respond /my public (ssh )?key is (.*)/i, (msg) ->
    user = robot.brain.userForId(msg.envelope.user.id).key
    key = msg.match[2]
    if !/ssh-rsa AAAA[0-9A-Za-z+\/]+[=]{0,3}( [^@]+@[^@]+)?/.test(key)
      return msg.send "`#{key}` is not a valid public SSH key. You can find your key with `cat ~/.ssh/id_rsa.pub`."
    
    user.key = key
    msg.send "Okay, I stored your public SSH key as #{key}"

  robot.respond /(what is |show )?my public (ssh )?key$/i, (msg) ->
    user = robot.brain.userForId(msg.envelope.user.id).key
    key = user.key
    if !key
      return msg.send "I don't know your public SSH key. Add it with `#{robot.name} my key is <key>`. You can find your key with `cat ~/.ssh/id_rsa.pub`."
    msg.send "Your public ssh key is #{key}"

  robot.respond /(delete|remove|forget) my public (ssh )?key$/i, (msg) ->
    user = robot.brain.userForId(msg.envelope.user.id).key
    if !user.key
      return msg.send "I don't know your public SSH key. I can't forget something I don't know."
    delete user.key
    msg.send "Okay, I removed your public SSH key."
