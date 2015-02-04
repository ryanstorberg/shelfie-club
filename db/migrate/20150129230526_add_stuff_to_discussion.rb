class AddStuffToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :book_id, :integer
    add_column :discussions, :user_id, :integer
    add_column :discussions, :opening, :string
  end
end
