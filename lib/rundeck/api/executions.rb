module RundeckAPI
  module Executions
    def executions_status(method=:get, id)
      send(method, "/executions/#{id}" ,valid_methods: %i(get delete))
    end

    def executions_abort(id)
      send(:get, "/executions/#{id}/abort")
    end

    def executions_output(id)
      send(:get, "/executions/#{id}/output")
    end

    def executions_output_state(id)
      send(:get, "/executions/#{id}/output/state")
    end

    def executions_output_step(id, stepctx)
      send(:get, "/executions/#{id}/output/step/#{stepctx}")
    end

    def executions_output_node(id, node)
      send(:get, "/executions/#{id}/output/node/#{node}")
    end

    def executions_output_node_step(id, node, stepctx)
      send(:get, "/executions/#{id}/output/node/#{node}/step/#{stepctx}")
    end

    def executions_delete
      send(:post, "/executions/delete")
    end

    def executions_metrics
      send(:get, "/executions/delete")
    end
  end
end
