class Product < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :tracks
  has_many :users, :through => :user_product_xrefs
  has_many :user_product_xrefs

  validates :name, :uniqueness => true

  def all_bug_ids
    all_bug_ids = Array.new
    self.tracks.each do |track|
      track.components.each do |component|
        component.features.each do |feature|
          feature.bugs.each do |bug|
            all_bug_ids << bug.id
          end
        end
      end
    end
    return all_bug_ids
  end

end
