class ClubsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_club_owner!, only: [ :new, :edit, :create, :update, :destroy ]
  before_action :set_club, only: [ :new, :edit, :create, :update, :destroy ]

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
    @country = country_name(@club.country)
    if app_user == "member"
      @subscription = Subscription.find_by(club_id: params[:id].to_i,
                                           member_id: current_member.id)
    elsif app_user == "club_owner"
      @workout = current_club_owner.club.workouts.build
    end
    @subscriptions = Subscription.where(club_id: params[:id].to_i)
    @workouts = @club.workouts
  end

  def new
    if @club
      redirect_to @club
    else
      @club = Club.new
      @club.club_owner_id = current_club_owner.id
    end
  end

  def edit
  end

  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club,
                      notice: 'You have successfully created a club.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club,
                      notice: 'You have successfully updated the club.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @club.destroy if @club.club_owner_id == current_club_owner.id
    respond_to do |format|
      format.html { redirect_to clubs_url }
      format.json { head :no_content }
    end
  end

  private

    def set_club
      @club = current_club_owner.club
    end

    def club_params
      params.require(:club).permit( :name, :country, :city, :address,
                                   :postal_code, :phone_number, :club_owner_id)
    end

    def country_name(country)
      c_name = ISO3166::Country[country]
      c_name.translations[I18n.locale.to_s] || c_name.name
    end
end
