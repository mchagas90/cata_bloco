module Api
  module V1
    class WebhooksController < ApplicationController
      before_action :valid_bot_message?

      def receive
        data = JSON.parse(request.body.read)
        Webhook::Command.execute(data)

        render nothing: true, status: :ok
      end

      def valid_bot_message?
        # must be implemented
      end
    end
  end
end
