class Track < ActiveRecord::Base
  belongs_to :product
  belongs_to :owner, :class_name => "User"
  has_many :users, :through => :user_track_xrefs
  has_many :user_track_xrefs
  has_many :components
  has_many :repositories
end
