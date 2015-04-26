module ApplicationHelper
  def app_user
    if member_signed_in?
      "member"
    elsif club_owner_signed_in?
      club_owner_signed_in?
      "club_owner"
    end
  end
end
