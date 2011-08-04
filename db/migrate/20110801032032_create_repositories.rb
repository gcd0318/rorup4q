class CreateRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories do |t|
      t.string :name
      t.integer :track_id
      t.string :password
      t.string :lr_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :repositories
  end
end
