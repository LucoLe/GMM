class SubscriptionsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_member!, only: [ :create ]
  before_action :authenticate_user, only: [ :destroy ]


  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to :back, notice: 'Subscription was successfully created.' }
        format.json {  }
      else
        format.html { render club_path(params[:id]) }
        format.json {  }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Subscription was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

    def authenticate_user
      if app_user == "member"
        :authenticate_member!
      else
        :authenticate_club_owner!
      end
    end
    # # Use callbacks to share common setup or constraints between actions.
    # def set_subscription
    #   @subscription = Subscription.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit( :club_id, :member_id)
    end
end
