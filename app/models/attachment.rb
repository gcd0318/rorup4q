class Attachment < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  belongs_to :testcase
  belongs_to :bug

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '' )
  end  

  def attach_file=(f_field)
    self.name = base_part_of(f_field.original_filename)
#    self.data = f_field.read
  end

end
