class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :contact_number, :unit_attributes
  # attr_accessible :title, :body

  has_many :logs
  has_many :units
  accepts_nested_attributes_for :units

  def role
    admin? ? "admin" : "user"
  end

  def admin?
    email == "admin@example.com"
  end

  def display_name
    email    
  end
end