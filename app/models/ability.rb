class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.role == "admin"
        can :manage, :all
      elsif user.role == "teacher"
        teacher
      elsif user.role == "super_teacher"
        super_teacher
      elsif user.role == "student"
        student
      else
        guest
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end

  private
    def admin
      can :manage, :all
    end

    def teacher
      can :manage, :courses
      can :manage, :lessons
      can :manage, :users
    end

    def super_teacher
      teacher
      can :manage, :posts
    end

    def student
      can :view, :courses
      can :view, :lessons
    end

    def guest
      can :view, :public_courses
      can :view, :public_lessons
    end
end
