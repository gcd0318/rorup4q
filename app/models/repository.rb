class Repository < ActiveRecord::Base
  belongs_to :track
  require 'grit'
  include Grit

  def get_commits
    repo = Repo.new(self.filepath)
    return repo.commits
  end

  def get_s_commits(bug, s)
    commits_arr = Array.new
    repo = Repo.new(self.filepath)
    repo.commits.each do |c|
      if c.message.include? s
        commits_arr << c
      end
    end
    return commits_arr
  end
  
  def get_commit_by_id id
    repo = Repo.new(self.filepath)
    return repo.commit(id)
  end

  def is_main
    return self.track.main_repo_id == self.id
  end


  def earlier_commits c
    repo = Repo.new(self.filepath)
    ecs = repo.commits_between(repo.commits.last, c)
    ecs.pop
    return ecs
  end
  
  def commits_diff c1, c2
    p Repo.new(self.filepath).diff(c1, c2)
    return Repo.new(self.filepath).diff(c1, c2)
  end

end
