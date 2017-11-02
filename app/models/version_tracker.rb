class VersionTracker < ApplicationRecord
  belongs_to :task
  has_many :version_tracker_materials, dependent: :destroy
  has_many :version_tracker_comments, dependent: :destroy
  accepts_nested_attributes_for :version_tracker_materials
end
