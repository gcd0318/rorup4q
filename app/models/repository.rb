class Repository < ActiveRecord::Base
  belongs_to :track
  require 'grit'
  include Grit

  def get_commits
    @repo = Repo.new(self.filepath)
    return @repo.commits
  end

end
