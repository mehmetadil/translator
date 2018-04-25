class Profile < ApplicationRecord
  extend Enumerize
  enumerize :academic_title, in: { graduate: 0, master: 1, associate_professor: 2, professor: 3 }
  belongs_to :user
  has_attached_file :avatar,
                    styles: {
                      thumb:   '10x10#',
                      small:   '150x150>',
                      medium: '210x260#'
                    },
                    default_url: ActionController::Base.helpers.asset_path('default_avatar.svg')
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def full_name
    [first_name, last_name].reject(&:empty?).join(' ')
  end

  def self.academic_title_attirbutes
  Hash[Profile.academic_titles.map { |k,v| [k, Profile.academic_title_attribute_name("academic_title.#{k}")] }]
end
end
