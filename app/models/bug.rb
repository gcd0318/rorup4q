class Bug < ActiveRecord::Base
  has_many :bug_histories
  
  has_many :users, :through=>:user_bug_xrefs
  has_many :user_bug_xrefs
  has_many :testcases, :through => :testcase_bug_xrefs
  has_many :testcase_bug_xrefs
  has_many :attachments
  belongs_to :reporter, :class_name => "User", :foreign_key => 'reporter_id'
  belongs_to :feature
  belongs_to :build
  belongs_to :assign_to, :class_name => 'User', :foreign_key => 'assign_to_id'

  has_many :from_xrefs, :class_name => "BugXref", :foreign_key => :to_bug_id
  has_many :to_xrefs, :class_name => "BugXref", :foreign_key => :from_bug_id
  
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :feature_id
  validates_presence_of :assign_to_id

end
