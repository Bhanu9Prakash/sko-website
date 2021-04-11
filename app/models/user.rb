class User < ApplicationRecord
  
  include ActionText::Attachable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  rolify
    
  has_many :albums, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :discussions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :nullify

  has_many :comments, dependent: :nullify
  
  has_many :reviews, dependent: :nullify
  
  has_many :houses, dependent: :nullify
  
  has_many :kids, dependent: :nullify
  
  
  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:project_lead)
      self.add_role(:volunteer)
      self.add_role(:alumni)
    else
      self.add_role(:alumni) if self.roles.blank?
    end
  end
  
  
end
