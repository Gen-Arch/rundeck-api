require 'json'
require 'faraday'

module RundeckAPI
  class Request

    HTTP_METHODS = %i(get post put delete)

    def method_missing(name, *args, **opts)
      super unless HTTP_METHODS.include?(name)
      super unless args.size == 1

      endpoint = args.shift
      request(name, endpoint, **opts)
    end

    private
    def request(method, endpoint, valid_methods: nil, **opts)
      if valid_methods
        raise 'invalid http method' if valid_methods.include(method)
      end

      endpoint = File.join('api', @version, endpoint)

      resp = conn.send(method, endpoint, opts) do |req|
        req.headers['X-Rundeck-Auth-Token'] = @token
        req.headers['Accept']               = 'application/json'
      end

      raise ResponseError, resp.body unless resp.success?

      JSON.parse(resp.body, symbolize_names: true)
    end

    def conn
      return @conn if @conn

      @conn = Faraday.new(:url => @url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end
