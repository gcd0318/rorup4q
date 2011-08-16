require 'grit'

module Codemgr
  class CodeManager
    attr_reader :filepath, :mgr_type

    def initialize(filepath, mgr_type = 'git')
      @filepath, @mgr_type = filepath, mgr_type
    end

    def commits_diffs (repo)
      if self.mgr_type == 'git' && repo.mgr_type == 'git'
        r1 = Grit::Repo.new(self.filepath)
        r2 = Grit::Repo.new(repo.filepath)
        return r1.commit_deltas_from r2
      end
    end
  end
end
