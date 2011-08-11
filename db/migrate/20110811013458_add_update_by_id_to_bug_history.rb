class AddUpdateByIdToBugHistory < ActiveRecord::Migration
  def self.up
    add_column :bug_histories, :update_by_id, :integer
  end

  def self.down
    remove_column :bug_histories, :update_by_id
  end
end
