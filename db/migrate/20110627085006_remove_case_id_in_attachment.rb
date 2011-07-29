class RemoveCaseIdInAttachment < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE attachments DROP COLUMN case_id"
  end

  def self.down
  end
end
