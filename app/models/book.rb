class Book < ActiveRecord::Base
  # Associations
  has_many :read_books
  has_many :users, through: :read_books
  has_many :discussions
  has_many :posts, through: :discussions

  # Validations
  validates :isbn, uniqueness: true
end
