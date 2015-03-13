class User < ActiveRecord::Base
  # Associations
  has_many :active_relationships,  class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :readerships, dependent: :destroy
  has_many :books, through: :readerships
  has_many :discussions
  has_many :posts
  has_many :replies
  has_secure_password
  has_attached_file :avatar, :styles => { :small => "30x30#", :medium => "60x60#", :large => "180x180#" }, :default_url => "defaults/:style.jpg"

  # Validations
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :email, :uniqueness => true

  # Instance Methods
  def knowledge_ratio
    total_pages = books.sum(:pages)
    percentage  = {}
    books.select(:category).distinct(:false).each do |book|
      percentage[book.category] = ((books.where(category: book.category).sum(:pages) / total_pages.to_f) * 100)
    end
    percentage.sort_by{ |k, v| v }.reverse
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
