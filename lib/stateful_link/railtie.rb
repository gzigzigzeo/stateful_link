module StatefulLink
  class Railtie < ::Rails::Railtie
    config.to_prepare do
      ActionController::Base.send(:include, StatefulLink::ActionAnyOf)
      ActionController::Base.helper(StatefulLink::Helper)
    end  
  end
end