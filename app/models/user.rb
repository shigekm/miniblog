class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :bio
  validates :username, :presence => true
  validates :username, :uniqueness => { :case_sensitive => false }
  validates :username, :format => { :with => /^[A-Za-z][0-9A-Za-z_\-]+$/ }
  validates :username, :length => { :in =>4..16 }

  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end
end
