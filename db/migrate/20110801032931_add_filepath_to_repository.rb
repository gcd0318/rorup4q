class AddFilepathToRepository < ActiveRecord::Migration
  def self.up
    add_column :repositories, :filepath, :string
  end

  def self.down
    remove_column :repositories, :filepath
  end
end
