class CreateBugHistories < ActiveRecord::Migration
  def self.up
    create_table :bug_histories do |t|
      t.integer :bug_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :bug_histories
  end
end
