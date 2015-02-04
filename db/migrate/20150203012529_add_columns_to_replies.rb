class AddColumnsToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :user_id, :integer
    add_column :replies, :post_id, :integer
    add_column :replies, :content, :text
  end
end
