module Muppet
  module Setup
    @@configuration = {
      host: "localhost",
      pool_size: 5,
      timeout: 5,
      port: 27017
    }

    def configure(&user_config)
      @@configuration.merge!(user_config.call)
    end

    def config
      @@configuration
    end

  end
end