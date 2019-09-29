class User < ApplicationRecord
 mount_uploader :avatar, AvatarUploader
 
  
  has_many :coaches
  has_many :comments
  has_many :tutorials
  has_many :enrollments
  has_many :enrolled_tutorials, through: :enrollments, source: :tutorial
  has_one_attached :avatar
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(tutorial)
    return enrolled_tutorials.include?(tutorial)
  end

end
