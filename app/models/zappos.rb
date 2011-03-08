require 'rubygems'
require 'httparty'
 
class Zappos
  include HTTParty
  base_uri 'api.zappos.com'
  default_params :key => 'eaadc98bce3692bda86dbbb684e62355d3b6c88a'
 
  def self.search(term)
    term = URI.encode(term)
    get("/Search?term=#{term}")
  end
 
  def self.get_stores_by_zip(zip)
    get("/v1/stores(postalCode=#{zip})")
  end
end