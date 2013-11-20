Collection = require './collection'

class Slaves extends Collection

    url: => "#{ env.SINGULARITY_BASE }/#{ constants.apiBase }/slaves/#{ @slaveType }"

    initialize: (models, { @slaveType }) =>

    parse: (slaves) ->
        _.each slaves, (slaveString, i) ->
            slave = {}
            slave.slave = slaveString
            slaves[i] = slave

        slaves

module.exports = Slaves