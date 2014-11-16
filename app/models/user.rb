class User < ActiveRecord::Base
  attr_accessor :avatar_file_name
  has_many :read_books
  has_many :books, through: :read_books
  has_secure_password

  has_attached_file :avatar, :styles => { :medium => "180x180>", :thumb => "30x30>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
