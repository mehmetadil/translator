class Profile < ApplicationRecord
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
end
