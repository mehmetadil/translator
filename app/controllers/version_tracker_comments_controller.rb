class VersionTrackerCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @version_tracker_comment = VersionTrackerComment.new(tracker_comment_params)
    @version_tracker_comment.save
    redirect_back(fallback_location: :back)
  end

  private

  def tracker_comment_params
    params.require(:version_tracker_comment).permit(:content, :user_id,
                                                    :version_tracker_id)
  end
end
