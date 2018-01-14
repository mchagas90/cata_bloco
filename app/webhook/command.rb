module Webhook
  class Command
    attr_accessor :data, :bot

    def self.execute(data)
      new(data).execute
    end

    def initialize(data)
      @bot = Services::TelegramBot
      @data = data.with_indifferent_access
    end

    def execute
      command_router if valid?
    end

    def command_router
      case command
      when '/cata_bloco'
        bot.send_message(to_id, build_message)
      else
        bot.send_message(to_id, 'Comando não reconhecido')
      end
    end

    def to_id
      data[:message][:from][:id]
    end

    def command
      data[:message][:text].to_s
    end

    def valid?
      permitted_commands.include?(command)
    end

    def permitted_commands
      [
        '/cata_bloco'
      ]
    end

    def to_name
      data[:message][:from][:first_name]
    end

    def build_message
      "#{greeting_message(to_name)}\n" \
      "Segue a lista de blocos que encontrei: \n" \
      "#{message}"
    end

    def message
      'lista fake de blocos'
    end

    def greeting_message(to_name)
      "Olá #{to_name}, tudo bem?"
    end
  end
end
