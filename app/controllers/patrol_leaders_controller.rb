class PatrolLeadersController < InheritedResources::Base

  def index
    @patrol_leaders = PatrolLeader.all
  end

  def new
    @patrol_leader = PatrolLeader.new
  end

  def create
    scout_id = patrol_leader_params[:scout_id]
    user_id = patrol_leader_params[:user_id]
    @patrol_leader = LeaderBuilder.new(PatrolLeader).build_leader(patrol_leader_params, scout_id, user_id)
    if @patrol_leader.save
      redirect_to patrol_leaders_path, notice: 'Patrol Leader was successfully appointed.'
    else
      render :new
    end
  end

  private

    def patrol_leader_params
      params.require(:patrol_leader).permit(:phone, :course, :scout_id, :patrol_id, :user_id)
    end
end
