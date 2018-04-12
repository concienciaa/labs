class SessionController < ApplicationController
  

  def create ; end
  
  def login
    user = User.find_by_login(params[:login])
	@error = nil
    if user && (user.password == params[:password])
          session[:user_id] = user.id
          redirect_to calculator_input_path
      else
	      session[:user_id] = nil
	      @error = 'Введен неправильный логин или пароль,
		  пожалуйста, проверьте правильность ввода'
		  if user
		    @bad = user.password
		  end
		  @p = params[:password]
		  @lel = params[:password]
          render session_create_path
      end
	
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/session/create'
  end
  
end
