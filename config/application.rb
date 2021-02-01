require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module NewPro
  class Application < Rails::Application
    config.load_defaults 6.1

    
  end
end
