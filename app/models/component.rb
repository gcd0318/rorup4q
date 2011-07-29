class Component < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  belongs_to :track
  has_many :users, :through => :user_component_xrefs
  has_many :user_component_xrefs
  has_many :features
end
