Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # localhost:3000にアクセスが来た場合　BoardsControllerクラスのindexメソッドを実行
  root 'boards#index'
end
