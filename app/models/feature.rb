class Feature < ActiveRecord::Base
  belongs_to :component
  belongs_to :owner, :class_name => "User"
  has_many :users, :through => :user_feature_xrefs
  has_many :user_feature_xrefs
  has_many :testcases
  has_many :bugs

  validates_presence_of :name

end
