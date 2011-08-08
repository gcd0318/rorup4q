class FixingCode < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :approver, :class_name => 'User'
  belongs_to :bug
end
