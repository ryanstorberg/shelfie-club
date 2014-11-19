class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string            :username
      t.string            :email
      t.string            :password_digest
      t.has_attached_file :avatar
      
      t.timestamps
    end
    add_index "users", ["email"], name: "index_users_on_email", unique: true
  end
end
