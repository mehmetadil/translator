module ProfilesHelper

  def self.profile_belongs_to_user?(profile, current_user)
    profile.user == current_user
  end
end
