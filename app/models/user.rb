class User < ActiveRecord::Base
  has_many :read_books
  has_many :books, through: :read_books
  has_secure_password
end
