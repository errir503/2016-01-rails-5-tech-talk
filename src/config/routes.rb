Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  scope '/table' do
    get '/:id' => 'tables#show', as: :table
    post '/:id' => 'tables#estimate'
  end
end
