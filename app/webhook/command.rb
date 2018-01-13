module Webhook
  class Command
    attr_accessor :data

    def self.execute(data)
      new(data).execute
    end

    def initialize(data)
      @data = data.with_indifferent_access
    end

    def execute
      command_router(command) if valid?
    end

    def command
      @data[:message][:text].to_s
    end

    def command_router(command)
      # must be implemented
    end

    def valid?
      permitted_commands.include?(command)
    end

    def permitted_commands
      [
        '/cata_bloco'
      ]
    end
  end
end
