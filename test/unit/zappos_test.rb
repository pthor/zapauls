require 'test_helper'

class ZapposTest < ActiveSupport::TestCase
  
  def setup
    @product_SKUs = ["7564933",7590514]
  end
  
  # Replace this with your real tests.
  test "product api can return more than one sku" do
    response = Zappos.product(@product_SKUs)
    puts response.inspect
    assert response.parsed_response["statusCode"] == "200"
    assert response['product'].size == 2
  end
  
  test "product can take a single sku as a string" do
    response = Zappos.product(@product_SKUs.first)
    puts response.inspect
    assert response.parsed_response["statusCode"] == "200"
    assert response['product'].size == 1
  end
  
  test "no products returned if no sku given" do
    response = Zappos.product('')
    puts response.inspect
    assert response.parsed_response["statusCode"] == "200"
    assert response['product'].size == 0
  end
  
end