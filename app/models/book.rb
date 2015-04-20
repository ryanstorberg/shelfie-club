class Book < ActiveRecord::Base
  # Associations
  has_many :read_books
  has_many :users, through: :read_books
  has_many :discussions
  has_many :posts, through: :discussions

  # Validations
  validates :isbn, uniqueness: true

  # Class Methods
  def self.search(text, search_size = nil)
    if search_size == "small"
      GoogleBooks.search(text, {:count => 3}).select do |book|
        !book.image_link.blank? && !book.isbn.blank?
      end
    else
      GoogleBooks.search(text).select do |book|
        !book.image_link.blank? && !book.isbn.blank?
      end
    end
  end
end
