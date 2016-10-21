class MilestonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]

  # GET /milestones
  # GET /milestones.json
  def index
    @notStarted = Milestone.where(state: "to_do")
    @inProgress = Milestone.where(state: "doing")
    @completed = Milestone.where(state: "completed")
  end

  # GET /milestones/1
  # GET /milestones/1.json
  def show
      session[:return_to] ||= request.referer
  end

  # GET /milestones/new
  def new
    @milestone = Milestone.new
    #@milestone = Milestone.new(:project_id => params[:project_id])
    #@project = Project.find(params[:project_id])
  end

  # GET /milestones/1/edit
  def edit
      session[:return_to] ||= request.referer
  end

  # POST /milestones
  # POST /milestones.json
  def create
    #@project = Project.find(params[:id])
    #@milestone = @project.milestones.create(milestone_params)

     @milestone = Milestone.new(milestone_params)
    respond_to do |format|
      if @milestone.save
        format.html { redirect_to @milestone, notice: 'Milestone was successfully created.' }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestones/1
  # PATCH/PUT /milestones/1.json
  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to @milestone, notice: 'Milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    @milestone.destroy
    respond_to do |format|
      format.html { redirect_to milestones_url, notice: 'Milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milestone_params
      params.require(:milestone).permit(:name, :startDate, :completionDate, :state, :project_id)
    end
end
