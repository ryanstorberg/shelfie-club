class CreateReadBooks < ActiveRecord::Migration
  def change
    create_table :read_books do |t|
      t.belongs_to :user
      t.belongs_to :book

      t.timestamps
    end
  end
end