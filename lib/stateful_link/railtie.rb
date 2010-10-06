module StatefulLink
  class Railtie < ::Rails::Railtie
    config.to_prepare do
      ApplicationController.helper(StatefulLink::Helper)
    end  
  end
end