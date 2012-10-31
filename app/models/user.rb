require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :owned_products, :class_name => "Product", :foreign_key => "owner_id"
  has_many :products, :through => :user_product_xrefs
  has_many :user_product_xrefs
  has_many :tracks, :through => :user_track_xrefs
  has_many :user_track_xrefs, :dependent => :destroy
  has_many :component, :through => :user_component_xrefs
  has_many :user_component_xrefs
  has_many :features, :through => :user_feature_xrefs
  has_many :user_feature_xrefs
  has_many :assigned_testcases, :class_name => "Testcase", :foreign_key => "assign_to_id"
  has_many :owned_testcases, :foreign_key => 'owner_id', :class_name => 'Testcase'
  has_many :testcases, :through => :user_testcase_xrefs
  has_many :user_testcase_xrefs
  has_many :bugs, :through => :user_bug_xrefs
  has_many :user_bug_xrefs
  has_many :reported_bugs, :class_name => "Bug", :foreign_key => 'reporter_id'
  has_many :assigned_bugs, :class_name => "Bug", :foreign_key => "assign_to_id"

  validates :username, :presence => true, :uniqueness => true

  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_present

  class << self
    def authenticate(username, password)
      if user = find_by_username(username)
        if user.hashed_password == encrypt_password(password, user.seed)
          user
        end
      end
    end

    def encrypt_password(password, seed)
      Digest::SHA2.hexdigest(password + "wibble" + seed)
    end
  end

  # 'password' is a virtual attribute
  def password=(password)
    @password = password
    if password.present?
      generate_seed
      self.hashed_password = self.class.encrypt_password(password, seed)
    end
  end
  
  before_destroy :dont_destroy_cguo
  def dont_destroy_cguo
    raise "Can't destroy cguo" if self.username == 'cguo'
  end

  after_destroy :ensure_an_admin_remains

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end    
  
  private
    def password_must_be_present
      errors.add(:password, "Missing password" ) unless hashed_password.present?
    end

    def generate_seed
      self.seed = self.object_id.to_s + rand.to_s
    end
end
