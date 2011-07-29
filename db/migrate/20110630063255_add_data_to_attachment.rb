class AddDataToAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :data, :binary
  end

  def self.down
    remove_column :attachments, :data
  end
end
