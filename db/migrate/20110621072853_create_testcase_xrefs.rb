class CreateTestcaseXrefs < ActiveRecord::Migration
  def self.up
    create_table :testcase_xrefs, :id => false do |t|
      t.integer :from_testcase_id
      t.integer :to_testcase_id
      t.string :link_type

      t.timestamps
    end
  end

  def self.down
    drop_table :testcase_xrefs
  end
end
