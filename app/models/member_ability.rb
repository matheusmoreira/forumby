class MemberAbility

  include CanCan::Ability

  def initialize(member)
    member ||= Member.new
    can :read, :all
    if member.administrator?
      can :manage, :all
    else
      unless member.banned?
        can :create, [ Topic, Post ]
        can [ :update, :destroy ], Post, :member_id => member.id
        can :update, [ Topic, Post ] if member.moderator?
        can :update, Topic do |topic|
          can? :update, topic.first_post
        end
        can :destroy, Topic do |topic|
          can? :destroy, topic.first_post
        end
      end
    end
  end

end
