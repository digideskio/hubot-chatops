# Description:
#   Devo.ps integration
#
# Commands:
#   deploy|update myanmar staging - trigger deploy of the staging platform via devo.ps
#   reset|erase myanmar staging - trigger erase of the staging platform via devo.ps
#
# Author:
#   Vince
#

module.exports = (robot) ->
    robot.hear /(deploy|update) myanmar staging/i, (msg) ->
      robot.http('https://wh.devo.ps/boratbot/myanmar/deploy-staging')
          .post() (err, res, body) ->
            if err
              msg.send 'Error while starting deploy: ', err
            else
              msg.send 'Hurray! The staging platform is being (re-)deployed'

    robot.hear /(reset|erase) myanmar staging/i, (msg) ->
      robot.http('https://wh.devo.ps/boratbot/myanmar/reset-staging')
          .post() (err, res, body) ->
            if err
              msg.send 'Error while starting reset: ', err
            else
              msg.send 'Hurray! The staging platform is being erased / reset'

