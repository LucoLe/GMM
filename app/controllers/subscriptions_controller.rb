class SubscriptionsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_member!, only: [ :create, :destroy ]

  def create
    @subscription = current_member.subscriptions.build(subscription_params)

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
    @subscription = current_member.subscriptions.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Subscription was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit( :club_id)
    end
end
