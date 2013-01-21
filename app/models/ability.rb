class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, User
      can :manage, Unit
      can :manage, Location
      can :manage, TransferRecord
      can :manage, MaintenanceRepairLog
      can :manage, PulloutLog
      can :manage, AuditLog
    else
      can :read, Log do |log|
        user.units.include? log.unit_id
      end

      can :read, Unit, user_id: user.id
    end
  end
end
