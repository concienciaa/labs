require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save new empty Result' do
    result = Result.new
    assert !result.save
  end
  
  test 'should save Result only one time' do
    result = Result.new
    result.param = '1'
    result.res = '[1, 2, 3, 4, 5, 6, 7, 8, 9]'
    assert result.save
	pam = Result.new
    pam.param = '1'
    pam.res = '[1, 2, 3, 4, 5, 6, 7, 8, 9]'
	assert !pam.save
  end
end
