class Book < ActiveRecord::Base
  has_many :read_books
  has_many :users, through: :read_books
  has_many :discussions
  has_many :posts, through: :discussions
end
