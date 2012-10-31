class Build < ActiveRecord::Base
  has_many :bug_build_xrefs
  has_many :bugs, :through=>:bug_build_xrefs
end
