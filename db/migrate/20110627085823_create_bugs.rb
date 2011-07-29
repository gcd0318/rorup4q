class CreateBugs < ActiveRecord::Migration
  def self.up
    create_table :bugs do |t|
      t.string :title
      t.string :body
      t.integer :reporter_id
      t.string :status, :default=>'OPEN'
      t.integer :feature_id
      t.string :bug_type
      t.integer :build_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bugs
  end
end
