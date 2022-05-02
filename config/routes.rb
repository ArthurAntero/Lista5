Rails.application.routes.draw do
  devise_for :users, skip: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  namespace 'api' do
    namespace 'v1' do
      scope 'users' do
        get 'login', to: 'users#login'
        get 'logout', to: 'users#logout'
      end
      scope 'categories' do
        get 'index', to: 'categories#index'
        get 'show/:id', to: 'categories#show'
        post 'create', to: 'categories#create'
        patch 'update/:id', to: 'categories#update'
        delete 'delete/:id', to: 'categories#delete'
      end
      scope 'products' do
        get 'index', to: 'products#index'
        get 'show/:id', to: 'products#show'
        post 'create', to: 'products#create'
        patch 'update/:id', to: 'products#update'
        delete 'delete/:id', to: 'products#delete'
      end
      scope 'product_users' do
        post 'create', to: 'product_users#create'
        delete 'delete/:id', to: 'product_users#delete'
      end
    end
  end
end
