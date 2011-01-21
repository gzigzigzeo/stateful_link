module StatefulLink
  module Helper#:doc:   
    # Generates stateful link to something.
    # 
    # Options:
    #    :inactive - template of inactive state
    #    :active - template of active state
    #    :chosen - template of chosen state
    #    :state - block to determine state (action_state called if none)
    #
    # Any option may be proc.
    #
    # Example:
    #  stateful_link_to("foos#index", "bars#index", 
    #    :active => "<li class='active'>Good!</li>", 
    #    :chosen => "<li class='chosen'>#{link_to(...)}</li>"
    #  )
    #
    def stateful_link_to(*args)
      options = args.extract_options!
      active = args.first
      chosen = args.second
      state = options[:state] || proc { action_state(active, chosen) }
      raise ArgumentError, ":state should be proc" unless state.is_a?(Proc)
      state = instance_exec(&state)
      state = :active if state == true
      state = :inactive if state == false
      current = options[state]
      current.is_a?(Proc) ? instance_exec(&current) : current
    end
  end
end
