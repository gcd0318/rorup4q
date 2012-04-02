class SetDefaultStatusToTestcase < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE `rorup4q`.`testcases` MODIFY COLUMN `status` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'UNDO';"
  end

  def self.down
  end
end
