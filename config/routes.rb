Finance::Application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :entry_types, except: :show

  resources :entries,
            only: [:index, :create, :destroy],
            defaults: { format: :json }

  resources :incomes, only: [:create, :index, :destroy]

  resources :expenses, only: [:create, :index, :destroy]

  get 'dashboard', to: 'dashboard#index'
  match 'signup', to: 'users#new', via: :get
  root to: 'dashboard#index'
end
