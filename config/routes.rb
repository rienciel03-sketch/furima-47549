Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update]

  # Chrome DevToolsからの特定のリクエストによるRoutingErrorを抑制する
  get '/.well-known/appspecific/com.chrome.devtools.json', to: proc { [204, {}, ['']] }
end
