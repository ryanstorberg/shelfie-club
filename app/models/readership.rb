class Readership < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :book

  # Validations
  validates_uniqueness_of :user_id, :scope => [:book_id]
end
