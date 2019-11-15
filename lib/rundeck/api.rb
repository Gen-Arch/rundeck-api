require "rundeck/api/version"
require "rundeck/api/client"

module RundeckAPI
  class Error < StandardError; end
  class ResponseError < StandardError; end

  def self.client(url, token, **options)
    RundeckAPI::Client.new(url, token, options)
  end
end

