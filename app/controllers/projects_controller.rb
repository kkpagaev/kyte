class ProjectsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_project, only: %i[ show edit update destroy project_view repository_view ]

  # GET /projects or /projects.json
  def index
    @foo = "bar"
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  def project_view
    render turbo_stream:
      turbo_stream.replace('right-frame',
        partial: 'project_view',
        locals: { project: @project }
      )
  end

  def repository_view
    @repository = Repository.find(params[:repository_id])
    render turbo_stream:
      turbo_stream.replace('right-frame',
        partial: 'repository_view',
        locals: { repository: @repository }
      )
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :avatar)
    end
end
