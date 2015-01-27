class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :isbn
      t.string  :title
      t.string  :author
      t.string  :category
      t.integer :pages
      t.text    :description
      t.string  :cover_small
      t.string  :cover_medium
      t.string  :cover_large
      
      t.timestamps
    end
  end
end
