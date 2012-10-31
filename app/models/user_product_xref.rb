class UserProductXref < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
  validate :not_existed_xref
  
  private
    def not_existed_xref
      errors.add(:ids, "existed member" ) unless UserProductXref.where(:user_id=>user_id, :product_id=>product_id)
    end
end
