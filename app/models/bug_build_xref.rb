class BugBuildXref < ActiveRecord::Base
  belongs_to :bug
  belongs_to :build
end
