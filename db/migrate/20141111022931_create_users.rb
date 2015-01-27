class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string            :email
      t.string            :password_digest
      t.string            :username

      t.string            :first_name
      t.string            :last_name
      t.date              :date_of_birth
      t.string            :sex
      t.string            :location
      t.text              :about
      t.has_attached_file :avatar
      t.boolean           :verified?
      t.boolean           :admin?

      t.timestamps
    end
    add_index "users", ["email"], name: "index_users_on_email", unique: true
  end
end
