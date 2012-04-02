class Product < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :tracks
  has_many :users, :through => :user_product_xrefs
  has_many :user_product_xrefs

  validates :name, :uniqueness => true
end
