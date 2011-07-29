class AddTestcaseIdToAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :testcase_id, :integer
  end

  def self.down
    remove_column :attachments, :testcase_id
  end
end
