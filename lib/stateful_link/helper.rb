module StatefulLink
  module Helper#:doc:
    # Returns true if current controller and action names equals to any of passed.
    # Asterik as action name matches all controller's action.
    #
    # Examples:
    #   <%= "we are in PostsController::index" if action_any_of?("posts#index") %>
    #
    #   <%= "we are not in PostsController::index" unless action_any_of?("posts#index") %>
    #
    #   <% if action_any_of?("posts#index", "messages#index") %>
    #     we are in PostsController or in MessagesController
    #   <% end %>
    #
    def action_any_of?(*actions)
      actions.any? do |sub_ca|
        sub_controller, sub_action = extract_controller_and_action(sub_ca)
        controller.controller_path == sub_controller && (controller.action_name == sub_action || sub_action == '')
      end
    end

    # Returns link state related to current controller and action: :inactive, :active or :chosen.
    # A list of active actions is the first argument, chosen actions are the second argument.
    #
    # Examples:
    #   # :active for PostsController::index, :chosen for PostsController::* (except :index), 
    #   # :inactive otherwise.
    #   action_state("posts#index", "posts#")
    #   
    #   # :active for PostsController::new and PostsController::create, :inactive otherwise.
    #   action_state(["posts#new", "posts#create"])
    #
    #   # :active for PostsController::index, :chosen for MessagesController::* and
    #   # PostsController::* (except :index), :inactive otherwise.
    #   action_state("posts#index", ["posts#", "messages#"])
    #
    def action_state(active, chosen = nil)
      active = active.is_a?(String) ? [active] : active
      chosen = chosen.is_a?(String) ? [chosen] : chosen

      if action_any_of?(*active)
        :active
      else
        if !chosen.nil? && action_any_of?(*chosen) 
          :chosen
        else
          :inactive    
        end    
      end
    end
 
    # Extracts controller and action names from a string.
    #
    # Examples:
    #
    #   extract_controller_and_action("posts/index")       # ["posts", "index"]
    #   extract_controller_and_action("admin/posts/index") # ["admin/posts", "index"]
    #   extract_controller_and_action("admin/posts/index") # raises ArgumentError
    #
    def extract_controller_and_action(ca)
      raise ArgumentError, "Pass the string" if ca.nil?
      slash_pos = ca.rindex('#')
      raise ArgumentError, "Invalid action: #{ca}" if slash_pos.nil?
      controller = ca[0, slash_pos]
      action = ca[slash_pos+1..-1] || ""
      raise ArgumentError, "Invalid action or controller" if controller.nil?

      [controller, action]
    end
    
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
    def stateful_link_to(active, *args)
      options = args.extract_options!
      chosen = args.first
      state = options[:state] || proc { action_state(active, chosen) }
      raise ArgumentError, ":state should be proc" unless state.is_a?(Proc)
      state = instance_exec(&state)
      current = options[state]
      current.is_a?(Proc) ? instance_exec(&current) : current
    end
  end
end