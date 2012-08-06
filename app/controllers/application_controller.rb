class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  def initialize
    super
    @categories = Category.all
  end
end
