class AddMainRepoIdToTrack < ActiveRecord::Migration
  def self.up
    add_column :tracks, :main_repo_id, :integer
  end

  def self.down
    remove_column :tracks, :main_repo_id
  end
end
