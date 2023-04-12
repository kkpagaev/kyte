class BoilerplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_boilerplate, only: %i[ show edit update destroy ]

  # GET /boilerplates or /boilerplates.json
  def index
    @boilerplates = Boilerplate.all
  end

  # GET /boilerplates/1 or /boilerplates/1.json
  def show
  end

  # GET /boilerplates/new
  def new
    @boilerplate = Boilerplate.new
  end

  # GET /boilerplates/1/edit
  def edit
  end

  # POST /boilerplates or /boilerplates.json
  def create
    @boilerplate = Boilerplate.new(boilerplate_params)

    respond_to do |format|
      if @boilerplate.save
        format.html { redirect_to boilerplate_url(@boilerplate), notice: "Boilerplate was successfully created." }
        format.json { render :show, status: :created, location: @boilerplate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @boilerplate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boilerplates/1 or /boilerplates/1.json
  def update
    respond_to do |format|
      if @boilerplate.update(boilerplate_params)
        format.html { redirect_to boilerplate_url(@boilerplate), notice: "Boilerplate was successfully updated." }
        format.json { render :show, status: :ok, location: @boilerplate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @boilerplate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boilerplates/1 or /boilerplates/1.json
  def destroy
    @boilerplate.destroy

    respond_to do |format|
      format.html { redirect_to boilerplates_url, notice: "Boilerplate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boilerplate
      @boilerplate = Boilerplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def boilerplate_params
      params.require(:boilerplate).permit(:name, :git_link)
    end
end
