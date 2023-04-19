class RepositoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_repository, only: %i[ show edit update destroy ]

  # GET /repositories or /repositories.json
  def index
    @repositories = Repository.all
  end

  # GET /repositories/1 or /repositories/1.json
  def show
  end

  def add_member
    @repository = Repository.find(params[:repository_id])
    @user = User.find(params[:user_id])

    @repository.add_team_member(@user)

    redirect_to repository_view_path(:id => @repository.project_id, :repository_id => @repository.id)
  end

  def remove_member
    @repository = Repository.find(params[:repository_id])
    @user = User.find(params[:user_id])

    @repository.remove_team_member(@user)

    redirect_to repository_view_path(:id => @repository.project_id, :repository_id => @repository.id)
  end

  # GET /repositories/new
  def new
    @repository = Repository.new

    render turbo_stream:
      turbo_stream.replace('right-frame',
        template: 'repositories/new',
        locals: { repository: @repository }
      )
  end

  # GET /repositories/1/edit
  def edit
  end

  # POST /repositories or /repositories.json
  def create
    @repository = Repository.new(repository_params)
# @repository.user = current_user

    respond_to do |format|
      if @repository.save
        format.html { redirect_to repository_url(@repository), notice: "Repository was successfully created." }
        format.json { render :show, status: :created, location: @repository }
        format.turbo_stream do
          redirect_to project_view_path(:id => @repository.project_id)
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repositories/1 or /repositories/1.json
  def update
    respond_to do |format|
      if @repository.update(repository_params)
        format.html { redirect_to repository_url(@repository), notice: "Repository was successfully updated." }
        format.json { render :show, status: :ok, location: @repository }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repositories/1 or /repositories/1.json
  def destroy
    @repository.destroy

    respond_to do |format|
      format.html { redirect_to repositories_url, notice: "Repository was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream do
        redirect_to project_view_path(:id => @repository.project_id)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repository
      @repository = Repository.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repository_params
      params.require(:repository).permit(:title, :name, :boilerplate_id, :project_id)
    end
end
