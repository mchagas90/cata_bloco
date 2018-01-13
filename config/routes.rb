Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/webhook' => 'webhooks#receive', as: :receive_webhooks
    end
  end
end
