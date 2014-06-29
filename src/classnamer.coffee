# Description
#   A hubot script that does the things
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot class me - <what the respond trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   TAKAHASHI Kazunari[takahashi@1syo.net]

module.exports = (robot) ->
  robot.respond /class(?: me)?/i, (msg) ->
    msg.http("http://www.classnamer.com/index.txt?generator=generic")
      .get() (err, res, body) ->
        unless err
          msg.send body
