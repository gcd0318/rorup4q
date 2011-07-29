class DeleteLinkTypeFromTestcaseXref < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE testcase_xrefs DROP COLUMN link_type"
  end

  def self.down
  end
end
