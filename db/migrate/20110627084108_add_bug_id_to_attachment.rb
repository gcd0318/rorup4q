class AddBugIdToAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :bug_id, :integer
  end

  def self.down
    remove_column :attachments, :bug_id
  end
end
