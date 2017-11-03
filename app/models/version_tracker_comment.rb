class VersionTrackerComment < ApplicationRecord
  belongs_to :user
  belongs_to :version_tracker
end
