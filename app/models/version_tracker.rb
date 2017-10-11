class VersionTracker < ApplicationRecord
  belongs_to :task
  has_many :version_tracker_materials
end
