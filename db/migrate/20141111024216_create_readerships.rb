class CreateReaderships < ActiveRecord::Migration
  def change
    create_table :readerships do |t|
      t.belongs_to :user
      t.belongs_to :book

      t.timestamps
    end
  end
end