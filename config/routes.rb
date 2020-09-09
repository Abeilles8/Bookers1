Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # topページ
  root :to => 'books#top'

  # 投稿機能
  post 'books' => 'books#create'
  get 'books' => 'books#index'

  # 投稿→詳細ページ
  get "books/:id" => 'books#show', as: 'book'

  # edit,show,update,destroy
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id/show' => 'books#show', as: 'show_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
