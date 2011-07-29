class CreateUserProductXrefs < ActiveRecord::Migration
  def self.up
    create_table :user_product_xrefs, :id=>false do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_product_xrefs
  end
end
