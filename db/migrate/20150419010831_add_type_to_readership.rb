class AddTypeToReadership < ActiveRecord::Migration
  def change
    add_column :readerships, :status, :string
  end
end
