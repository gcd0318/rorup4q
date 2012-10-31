class Testcase < ActiveRecord::Base
  has_many :attachments
  belongs_to :feature
  belongs_to :owner, :class_name => "User"
  belongs_to :assign_to, :class_name => "User"
  has_many :from_xrefs, :class_name => "TestcaseXref", :foreign_key => :to_testcase_id
  has_many :to_xrefs, :class_name => "TestcaseXref", :foreign_key => :from_testcase_id
  has_many :bugs, :through => :testcase_bug_xrefs
  has_many :testcase_bug_xrefs
  has_many :executers, :class_name => 'User', :through => :user_testcase_xrefs
  has_many :user_testcase_xrefs

  validates :feature_id, :presence => true
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :owner

end
