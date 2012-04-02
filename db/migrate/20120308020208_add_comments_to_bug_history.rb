class AddCommentsToBugHistory < ActiveRecord::Migration
  def self.up
    add_column :bug_histories, :comments, :string
  end

  def self.down
    remove_column :bug_histories, :comments
  end
end
