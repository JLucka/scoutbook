class LeaderBuilder
  def initialize(leader_type)
    @type = leader_type
  end

  def build_leader(leader_params, scout_id, user_id)
    @leader = @type.create(leader_params)
    @leader.scout = Scout.find(scout_id)
    set_position(leader_params[:position])
    set_user(user_id)
    set_patrol(leader_params[:patrol_id])
    @leader
  end

  def set_user(user_id)
    if user_id != ""
      @leader.user = User.find(user_id)
    end
  end

  def set_position(position)
    @leader.scout.update(position: position || "Patrol Leader")
  end

  def set_patrol(patrol)
    @leader.scout.patrol_id = patrol
  end

end