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
 
  def self.product(sku)
    puts sku.kind_of? Array
    sku = sku.join(',') if sku.kind_of? Array
    get("/Product/#{sku}")
  end
end