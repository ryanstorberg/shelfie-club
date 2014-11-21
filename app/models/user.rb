class User < ActiveRecord::Base
  has_many :active_relationships,  class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :read_books, dependent: :destroy
  has_many :books, through: :read_books
  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "180x180>", :thumb => "40x40>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
