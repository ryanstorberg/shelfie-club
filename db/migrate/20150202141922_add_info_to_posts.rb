class AddInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :discussion_id, :integer
    add_column :posts, :user_id, :integer
    add_column :posts, :content, :text
  end
end
