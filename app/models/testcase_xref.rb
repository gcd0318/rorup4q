class TestcaseXref < ActiveRecord::Base
  belongs_to :from_testcase, :class_name => "Testcase"
  belongs_to :to_testcase, :class_name => "Testcase"
  validate :not_self_xref
  validate :not_existed_xref
  validates_presence_of :from_testcase_id
  validates_presence_of :to_testcase_id

  private
    def not_self_xref
      errors.add(:ids, "self-link" ) unless from_testcase_id != to_testcase_id
    end
    def not_existed_xref
      errors.add(:ids, "existed link" ) unless TestcaseXref.where(:from_testcase_id=>from_testcase_id, :to_testcase_id=>to_testcase_id)||TestcaseXref.where(:from_testcase_id=>to_testcase_id, :to_testcase_id=>from_testcase_id)
    end
end
