module Muppet
  module Setup
    @@configuration = {
      host: "localhost",
      port: 27017,
      database: "test"
    }

    def configure(&user_config)
      @@configuration.merge!(user_config.call)
    end

    def config
      @@configuration
    end

    def connect!
      @@connection = Mongo::Connection.new(@@configuration[:host],
        @@configuration[:port])
      @@database = @@connection.db(@@configuration[:database])
    end

    def database
      @@database
    end

    def connection
      @@connection
    end

  end
end