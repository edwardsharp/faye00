FayeRailsDemo::Application.routes.draw do
  faye_server '/faye', timeout: 25 do
    map '/chat' => RealtimeChatController
    map default: :block
  end

  resources :chat
  root to: 'chat#index'
end
