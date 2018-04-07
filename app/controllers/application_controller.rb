class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'digest/sha1'
  require './lib/zanata/zanata'
end
