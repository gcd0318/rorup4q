class ModifyColumnInAttachment < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE attachments DROP COLUMN path"
    add_column :attachments, :filepath, :string
  end

  def self.down
  end
end
