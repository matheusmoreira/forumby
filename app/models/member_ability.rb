class MemberAbility

  include CanCan::Ability

  def initialize(member)
    member ||= Member.new
    can :read, :all
    can :manage, :all if member.administrator?
  end

end
