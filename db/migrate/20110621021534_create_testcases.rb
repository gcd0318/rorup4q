class CreateTestcases < ActiveRecord::Migration
  def self.up
    create_table :testcases do |t|
      t.integer :feature_id
      t.string :title
      t.string :body
      t.string :status, :default=>'UNDO'
      t.integer :owner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :testcases
  end
end
