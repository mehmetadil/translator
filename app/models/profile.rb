class Profile < ApplicationRecord
  belongs_to :user

  def self.create_profile(user_id, first_name, last_name = '')
    @profile = Profile.new(first_name: first_name, last_name: last_name,
                           user_id: user_id)
    @profile.save
  end
end
