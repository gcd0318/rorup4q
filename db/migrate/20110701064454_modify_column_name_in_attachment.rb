class ModifyColumnNameInAttachment < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE attachments DROP COLUMN bug_id"
    execute "ALTER TABLE attachments DROP COLUMN testcase_id"
    add_column :attachments, :super_id, :integer
    add_column :attachments, :super_type, :string
  end

  def self.down
  end
end
