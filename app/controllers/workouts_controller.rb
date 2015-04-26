class WorkoutsController < ApplicationController
  include ApplicationHelper
  before_action :set_workout, only: [ :edit, :update, :destroy ]
  before_action :check_user, only: [ :edit, :update, :destroy ]

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to :back, notice: 'Workout was successfully created.' }
        format.json {  }
      else
        if app_user == "member"
          format.html { redirect_to :back, alert: 'Workout was not created.' }
        else
          format.html { redirect_to :back, alert: 'Workout was not created.' }
        end
        format.json {  }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        if app_user == "member"
          format.html { redirect_to member_path(@workout.member_id), notice: 'Workout was successfully updated.' }
        else
          format.html { redirect_to club_path(@workout.club_id), notice: 'Workout was successfully updated.' }
        end
        format.json {  }
      else
        format.html { render :edit }
        format.json {  }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Workout was successfully destroyed.' }
      format.json {  }
    end
  end

  private

    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit( :id, :title, :description, :club_id,
                                       :member_id)
    end

    def check_user
      if app_user == "member"
        redirect_to :back unless current_member.id == @workout.member_id
      elsif app_user == "club_owner"
        redirect_to :back unless current_club_owner.id == @workout.club_id
      else
        redirect_to :back
      end
    end

end
