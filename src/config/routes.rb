Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  get '/:table_id' => 'tables#show'
  post '/:table_id' => 'tables#estimate'
end
