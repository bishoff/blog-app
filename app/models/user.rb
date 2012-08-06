class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :recoverable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :lname, :login, :name, :password, :password_confirmation, :remember_me

  validates :name,     :presence => true
  validates :lname,    :presence => true
  validates :password, :presence => true
  validates :login,    :presence => true, :uniqueness => true
  validates :email,    :presence => true, :uniqueness => true

  has_many :posts,    :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
