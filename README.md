# README

https://railsguides.jp/active_record_basics.html

## 実行
- docker compose up
- docker compose exec web bash
- rails db:create


## ディレクトリ
- config/routes.rbでルーティング
- app/controllers/health_check_controller.rbでヘルスチェックコントローラー

## Modelsとマイグレーションファイル作成
- bundle exec rails generate model Todo title:string description:text completed:boolean
  - 以下が作成される
    - db/migrate/20250103140605_create_todos.rb
    - app/models/todo.rb
    - test/models/todo_test.rb
    - test/fixtures/todos.yml
  - title:string : 文字列（文字）を格納するためのフィールド
  - description:text : テキスト（長い文章）を格納するためのフィールド
  - completed:boolean : 真偽値（trueまたはfalse）を格納するためのフィールド
- bundle exec rails db:migrate
  - db/schema.rbが作成

## ルーティングとコントローラの作成
- bundle exec rails generate scaffold_controller Todo
  - 以下が作成される
    - db/migrate/20250103140605_create_todos.rb
    - app/controllers/todos_controller.rb
    - app/views/todos
    - app/views/todos/index.html.erb
    - app/views/todos/edit.html.erb
    - app/views/todos/show.html.erb
    - app/views/todos/new.html.erb
    - app/views/todos/_form.html.erb
    - app/views/todos/_todo.html.erb
    - test/controllers/todos_controller_test.rb
    - test/system/todos_test.rb
    - app/helpers/todos_helper.rb
    - app/views/todos/index.json.jbuilder
    - app/views/todos/show.json.jbuilder
    - app/views/todos/_todo.json.jbuilder
- config/routes.rb
```ruby
Rails.application.routes.draw do
  resources :todos
end
```
- resourcesは以下と同じ意味
| **HTTPメソッド** | **URL** | **アクション** | **用途** |
| --- | --- | --- | --- |
| GET | /todos | index | Todoの一覧を表示する |
| GET | /todos/new | new | Todoの新規作成画面を表示する |
| POST | /todos | create | Todoを新規作成する |
| GET | /todos/:id | show | Todoの詳細を表示する |
| GET | /todos/:id/edit | edit | Todoの編集画面を表示する |
| PATCH/PUT | /todos/:id | update | Todoを更新する |
| DELETE | /todos/:id | destroy | Todoを削除する |
