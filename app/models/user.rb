class User < ActiveRecord::Base
  enum role: [:user, :teacher, :super_teacher, :admin, :student]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :courses

  def admin?
    self.role == "admin"
  end

  private
    def set_default_role
      self.role ||= :user
    end
end
