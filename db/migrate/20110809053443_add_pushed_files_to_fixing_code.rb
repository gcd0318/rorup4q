class AddPushedFilesToFixingCode < ActiveRecord::Migration
  def self.up
    add_column :fixing_codes, :pushed_files, :string
  end

  def self.down
    remove_column :fixing_codes, :pushed_files
  end
end
