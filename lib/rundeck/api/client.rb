require 'rundeck/api/job'
require 'rundeck/api/request'
require 'rundeck/api/executions'

module RundeckAPI
  class Client < Request
    include Executions
    include Job

    def initialize(url, token, options)
      @url      = url
      @token    = token
      @version  = options[:version] || 33
    end
  end
end
