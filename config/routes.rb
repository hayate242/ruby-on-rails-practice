Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # localhost:3000にアクセスが来た場合　BoardsControllerクラスのindexメソッドを実行
  # root 'boards#index'

  # get 'boards', to: 'boards#index'
  # get 'boards/new', to: 'boards#new'
  # post 'boards', to: 'boards#create'
  # # /boards/1というパスにアクセス->params[:id]で1を取得することができる
  # get 'boards/:id', to: 'boards#show'

  # 自動でルートを追加
  # resources :boards, only: [:index, :new, :create, :show, :edit, :update]
  resources :boards
end
