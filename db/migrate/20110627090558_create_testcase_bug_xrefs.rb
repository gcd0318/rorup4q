class CreateTestcaseBugXrefs < ActiveRecord::Migration
  def self.up
    create_table :testcase_bug_xrefs, :id=>false do |t|
      t.integer :testcase_id
      t.integer :bug_id

      t.timestamps
    end
  end

  def self.down
    drop_table :testcase_bug_xrefs
  end
end
