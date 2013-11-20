Requests = require './Requests'

class RequestsSearch extends Requests

    url: => "#{ env.SINGULARITY_BASE }/#{ constants.apiBase }/history/requests/search?requestIdLike=#{ @query }"

    initialize: (models, { @query }) =>

    parse: (requests) ->
        _.each requests, (request, i) =>
            request.JSONString = utils.stringJSON request
            request.id = request.request.id
            request.name = request.request.name ? request.request.id
            request.deployUser = (request.request.executorData?.env?.DEPLOY_USER ? '').split('@')[0]
            request.instances = request.request?.instances
            request.daemon = request.request?.daemon
            request.timestamp = request.request?.timestamp
            request.timestampHuman = if request.timestamp? then moment(request.timestamp).from() else ''
            requests[i] = request
            app.allRequests[request.id] = request

        requests

module.exports = RequestsSearch