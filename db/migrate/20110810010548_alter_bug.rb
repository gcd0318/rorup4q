class AlterBug < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE bugs DROP COLUMN history"
  end

  def self.down
  end
end
