module Services
  class TelegramBot
    include HTTMultiParty

    ENDPOINT = 'https://api.telegram.org/bot'.freeze
    TOKEN = YAML.load_file("#{Rails.root}/config/bot.yml")['token']

    base_uri "#{ENDPOINT}#{TOKEN}"

    def self.send_message(to_id, message)
      options = {
        query: {
          chat_id: to_id,
          text: message
        }
      }
      post('/sendMessage', options)
    end
  end
end
