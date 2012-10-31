class FixingCode < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :approver, :class_name => 'User'
  belongs_to :bug

  def fix_file=(f_field)
    self.filepath = f_field.original_filename
  end

end
