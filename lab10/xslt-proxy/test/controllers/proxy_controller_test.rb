require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get proxy_input_url
    assert_response :success
  end

  test 'should get output' do
    get proxy_output_url
    assert_response :success
  end
  
  test 'shoult get result' do
    get proxy_output_url params: { param: '3', side: 'server' }
    
	assert_select "tbody" do
	  assert_select "th", 8
	end
	
	assert_select "tbody" do |elements|
	  elements.each do |element|
		assert_select element, "th", 2
      end
	end
  end
  
  test 'shoult get result1' do
    get proxy_output_url params: { param: '3', side: 'browser' }
    
	assert_select "elem", 4
	
  end
  
end
