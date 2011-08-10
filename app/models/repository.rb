class Repository < ActiveRecord::Base
  belongs_to :track
  require 'grit'
  include Grit
  
  validate :must_be_git_path

  def is_main
    return self.track.main_repo_id == self.id
  end

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
  def earlier_commits c
    repo = Repo.new(self.filepath)
    ecs = repo.commits_between(repo.commits.last, c)
    ecs.pop
    return ecs
  end
  def commits_diff c1, c2
    return Repo.new(self.filepath).diff(c1, c2)
  end

  def get_sub_folders path
    if ! path.include? self.filepath
      path = self.filepath +'/'+ path
    end
    if ! path.end_with? '/'
      oath = path + '/'
    end
    subs = Dir.glob(path+'*')
    sub_folders = Array.new
    subs.each do |s|
      if File.directory? s
        sub_folders << s.split('/')[-1]
      end
    end
    return sub_folders
  end
  def get_sub_files path
    if ! path.include? self.filepath
      path = self.filepath +'/'+ path
    end
    if ! path.end_with? '/'
      oath = path + '/'
    end
    subs = Dir.glob(path+'*')
    sub_files = Array.new
    subs.each do |s|
      if File.file? s
        sub_files << s.split('/')[-1]
      end
    end
    return sub_files
  end

  private
    def must_be_git_path
      if ! self.filepath.ends_with? '/'
        self.filepath = self.filepath + '/'
      end
      files = Dir.glob(self.filepath+'.git')
      errors.add(:filepath, "Invalid Repository Path" ) unless files.size > 0
    end

end
