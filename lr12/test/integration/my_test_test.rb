require 'test_helper'

class MyTestTest < ActionDispatch::IntegrationTest
  test 'shouldnt be able to perform calc without sign-in' do
    get "/calculator/input"
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', "Авторизация"
  end
  
  test 'registration,sign-in and calc' do
    post '/users', params: {user: {login: "AAA", password: "111"}}
    assert_redirected_to(controller: "calculator", action: "input")
    follow_redirect!
    assert_select "h3", "Лабораторная работа 12: Числа Армстронга"
    get '/calculator/output', params: {param: '1'}
    assert_equal assigns[:result], [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
