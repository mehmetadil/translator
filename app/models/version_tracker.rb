class VersionTracker < ApplicationRecord
  belongs_to :task
  has_many :version_tracker_materials
  has_many :version_tracker_comments
  accepts_nested_attributes_for :version_tracker_materials
end
