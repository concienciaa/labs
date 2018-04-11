require 'test_helper'

class ArmstrongControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get armstrong_input_url
    assert_response :success
  end

  test "should get output" do
    get armstrong_output_url
    assert_response :success
  end
  
  test 'should get zero' do
    get armstrong_output_url, params: { input_string: '2' }
	assert_equal assigns[:result], 'No numbers'
  end
  
  test 'should get timeout' do
    get armstrong_output_url, params: { input_string: '8' }
	assert_equal assigns[:result], 'TOO MUCH'
  end
  
  test 'should get inputerror' do
    get armstrong_output_url, params: { input_string: 'sgas' }
	assert_equal assigns[:result], 'Wrong input!'
  end
  
  test 'should get res' do
    get armstrong_output_url, params: { input_string: '3' }
	assert_equal assigns[:result], [153, 370, 371, 407]
  end
  
  test 'shoult get res2' do
    get armstrong_output_url, params: { input_string: '1' }
	assert_equal assigns[:result], [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

end
