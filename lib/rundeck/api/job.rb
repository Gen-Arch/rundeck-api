module RundeckAPI
  module Job
    def job(method=:get, id)
      send(method, "/job/#{id}", valid_methods: %i(get delete))
    end

    def job_executions(method=:get, id)
      send(method, "/job/#{id}/executions", valid_methods: %i(post get delete))
    end

    def job_execution_enable(id)
      send(:post, "/job/#{id}/execution/enable")
    end

    def job_execution_disable(id)
      send(:post, "/job/#{id}/execution/disable")
    end

  end
end
