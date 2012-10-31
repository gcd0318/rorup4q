class TestcaseBugXref < ActiveRecord::Base
  validates :testcase_id, :presence=>true
  validates :bug_id, :presence=>true
  belongs_to :testcase
  belongs_to :bug
end
