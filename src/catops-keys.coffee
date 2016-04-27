# Description
#   Store users' public keys in Hubot
#
# Commands:
#   hubot my key is <public_ssh_key> - Stores the user's public SSH key.
#   hubot forget my key - Stores the user's public SSH key.
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   contolini

module.exports = (robot) ->
  robot.respond /my (public |ssh )?key is (.*)/i, (msg) ->
    key = msg.match[2]
    if !/ssh-rsa AAAA[0-9A-Za-z+\/]+[=]{0,3}( [^@]+@[^@]+)?/.test(key)
      return msg.send "`#{key}` is not a valid public key. You can find your key with `cat ~/.ssh/id_rsa.pub`."
    
    msg.message.user.key = key
    msg.send "Okay, I stored your public key as #{key}"

  robot.respond /(what is |show )?my (public |ssh )?key$/i, (msg) ->
    key = msg.message.user.key
    if !key
      return msg.send "I don't know your public key. Add it with `#{robot.name} my key is <key>`. You can find your key with `cat ~/.ssh/id_rsa.pub`."
    msg.send "Your public ssh key is #{key}"
