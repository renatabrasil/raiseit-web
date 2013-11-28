class User < ActiveRecord::Base
  
  ADMIN_ROOT_ID = 1
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable
  
  has_and_belongs_to_many :roles
  
  belongs_to :user_account, polymorphic: true
         
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :role_ids
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.upcase)
  end
end
