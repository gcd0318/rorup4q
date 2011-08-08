class CreateFixingCodes < ActiveRecord::Migration
  def self.up
    create_table :fixing_codes do |t|
      t.string :filepath
      t.integer :bug_id
      t.integer :owner_id
      t.integer :approved
      t.integer :approver_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fixing_codes
  end
end
