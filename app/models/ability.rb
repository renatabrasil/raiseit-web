class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
      if user.role? :admin
        can :manage, :all
      elsif user.role? :instructor
        can :manage, WorkoutSheet
        can :manage, Training
        can :manage, TrainingGoal
        can :read, Person
        can :read, ModelWorkoutSheet
        can :manage, ClassGym, instructor_id: user.user_account.id
        cannot :create, ClassGym
        can :read, EntryRecord
      elsif user.role? :manager
        can :manage, Payment
        can :manage, Enrollment
        can :manage, ClassGym
        can :manage, Modality
        can :read, EntryRecord
        can :create, EntryRecord
        can :manage, Student
        can :manage, Instructor
        can :read, Person
      elsif user.role? :student
        can :profile, Student,  id: user.user_account.id
        can :show, Student,  id: user.user_account.id
        can :update, Student,  id: user.user_account.id
        can :read, Payment, individual_id: user.user_account.id
      end
       # if user_signed_in?
        # can :manage, :all
      # end
       # if user.administrador?
         # can :manage, :all
       # else
         # can :read, :all
       # end
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
end
