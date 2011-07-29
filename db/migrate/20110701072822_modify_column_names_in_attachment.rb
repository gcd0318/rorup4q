class ModifyColumnNamesInAttachment < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE attachments DROP COLUMN super_id"
    execute "ALTER TABLE attachments DROP COLUMN super_type"
    add_column :attachments, :bug_id, :integer
    add_column :attachments, :testcase_id, :integer
  end

  def self.down
  end
end
