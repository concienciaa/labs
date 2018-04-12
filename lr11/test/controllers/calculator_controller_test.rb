require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get calculator_input_url
    assert_response :success
  end

  test "shoult get zero result" do
    get calculator_output_url, params: { param: '2' }
	assert_select "h2", 1
  end
  
  test "should get non-zero result" do
    get calculator_output_url, params: { param: '3' }
	assert_select "td", 4
  end
  
  test "should get non-zero result2" do
    get calculator_output_url, params: { param: '4' }
	assert_select "td", 3
  end
  
  test "should get non-zero result3" do
    get calculator_output_url, params: { param: '5' }
	assert_select "td", 3
  end
  
  test "should get non-zero result4" do
    get calculator_output_url, params: { param: '6' }
	assert_select "td", 1
  end
  
  test "should get error" do
    get calculator_output_url, params: { param: 'q' }
	assert_select "h2", 1
  end
  
end
