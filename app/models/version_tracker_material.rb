class VersionTrackerMaterial < ApplicationRecord
  belongs_to :version_tracker
  has_attached_file :material #, :storage => :database
  #validates_attachment_content_type :attachment, :content_type => 'text/plain'
  #validates_format_of :attachment_file_name, :with => %r{\.(docx|doc|pdf)$\z/}i
  #validates_attachment_content_type :file, :content_type => %w(application/msword application/vnd.ms-office application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet)
  do_not_validate_attachment_file_type :material   
end
