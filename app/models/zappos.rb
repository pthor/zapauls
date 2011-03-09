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
    sku = sku.join(',') if sku.kind_of? Array
    uri = '/Product/' + sku.to_s + "?includes=#{include_uri_string()}"
    puts uri
    get(uri)
  end
  
  private 
  
  def self.extra_product_include
    ["description","styles"]
  end
  
  def self.include_uri_string
   URI.encode '["' + extra_product_include.join('","') + '"]'
  end
end