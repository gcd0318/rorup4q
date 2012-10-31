class BugXref < ActiveRecord::Base
  belongs_to :from_bug, :class_name => "Bug"
  belongs_to :to_bug, :class_name => "Bug"

  validate :not_self_xref
  validate :not_existed_xref
  validates_presence_of :from_bug_id
  validates_presence_of :to_bug_id

  private
    def not_self_xref
      errors.add(:ids, "self-link" ) unless from_bug_id != to_bug_id
    end
    def not_existed_xref
      errors.add(:ids, "existed link" ) unless BugXref.where(:from_bug_id=>from_bug_id, :to_bug_id=>to_bug_id)||BugXref.where(:from_bug_id=>to_bug_id, :to_bug_id=>from_bug_id)
    end
end
