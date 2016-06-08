class PatrolLeadersController < InheritedResources::Base

  def index
    @patrol_leaders = PatrolLeader.all
  end

  def new
    @patrol_leader = PatrolLeader.new
  end

  def create
    @patrol_leader = PatrolLeader.create(patrol_leader_params)
    if @patrol_leader.save
      @patrol_leader.scout = Scout.find(patrol_leader_params[:scout_id])
      @patrol_leader.scout.update(position: "Patrol Leader")
      @patrol_leader.scout.patrol = @patrol_leader.patrol
      @patrol_leader.scout.save
      redirect_to patrol_leaders_path, notice: 'Patrol Leader was successfully appointed.'
    else
      render :new
    end
  end

  private

    def patrol_leader_params
      params.require(:patrol_leader).permit(:phone, :course, :scout_id, :patrol_id)
    end
end
