class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :isbn
      t.string  :title
      t.string  :author
      t.string  :category
      t.integer :pages
      t.string  :cover_image
      
      t.timestamps
    end
  end
end
