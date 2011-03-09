require 'rubygems'
require 'httparty'
 
class Zappos
  include HTTParty
  base_uri 'api.zappos.com'
  default_params :key => 'eaadc98bce3692bda86dbbb684e62355d3b6c88a'
 
  def self.search(term, page=nil)
    page = "&page=#{page}" if !page.nil?
    term = URI.encode(term)
    uri = "/Search?term=#{term}&limit=12#{page.to_s}&includes=#{include_uri_string(extra_product_include)}"
    puts uri
    get(uri)
  end
  
  
 
  def self.product(sku)
    sku = sku.join(',') if sku.kind_of? Array
    uri = '/Product/' + sku.to_s + "?includes=#{include_uri_string(extra_search_include)}"
    get(uri)
  end
  
  def self.core_values
    get('/CoreValue')
  end
  
  private 
  
  def self.extra_product_include
    ["currentPage","pageCount"]
  end
  
  def self.extra_search_include
    ["description","styles"]
  end  
  def self.include_uri_string(include_params)
   URI.encode '["' + include_params.join('","') + '"]'
  end
end