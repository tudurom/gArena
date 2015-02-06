class User < ActiveRecord::Base
  enum role: [:user, :teacher, :super_teacher, :admin, :student]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Give an avatar for each user
  mount_uploader :avatar, AvatarUploader
  has_and_belongs_to_many :courses

  private
    def set_default_role
      self.role ||= :user
    end
end
