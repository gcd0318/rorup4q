class BugHistory < ActiveRecord::Base
  belongs_to :bug
  belongs_to :update_by, :class_name=>'User'
end
