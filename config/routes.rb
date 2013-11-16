FayeRailsDemo::Application.routes.draw do
  faye_server '/faye', timeout: 25 do
    map '/chat' => RealtimeChatController
    map '/p' => RealtimePController
    map default: :block
  end

  resources :chat
  resources :p
  root to: 'chat#index'
end
