require "test_helper"

describe LandingController do
  it "should get welcome" do
    get landing_welcome_url
    value(response).must_be :success?
  end

end
