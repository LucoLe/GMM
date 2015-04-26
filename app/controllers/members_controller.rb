class MembersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_member!, only: [ :new, :edit, :create, :update, :destroy ]
  before_action :set_member, only: [ :edit, :update]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    if current_member || current_club_owner
      @member = Member.find(params[:id])
      if app_user == "member"
        @workout = current_member.workouts.build
      end
      @workouts = @member.workouts
    else
      redirect_to root_path
    end
  end

  # GET /members/1/edit
  def edit
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = current_member
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit( :first_name, :last_name, :birthdate)
    end
end
