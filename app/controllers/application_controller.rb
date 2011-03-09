class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_core_values
  
  def set_core_values
    @core_values = Zappos.core_values
  end
  
end
