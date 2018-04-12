class CalculatorController < ApplicationController

  before_action :check

  def input
  end

  def add_to_db(arg, param)
      new_result = Result.create(param: param.to_s, res: arg.to_s)
  end

  def armstong?(numb)
    numb == numb.to_s.chars.sum{ |i| i.to_i**numb.to_s.size }
  end
  
  def find_armstrongs(n)
    if n.scan(/[-]|\d+/).join == n
	  n = n.to_i
      if n > 0 
        result = (10**(n-1)...10**n).find_all{ |numb| armstong?(numb) }
	    if result.none?
	      result = 'Таких чисел армстронга нет!'
	    end
		result
	  else
	    result = 'Введите число больше 0!' 
      end
	else
	  result = 'Введенное значение некорректно!'
	end
  end
  
  def output
    param = params[:param]
    if Result.find_by(param: "#{param}") == nil
        @result = find_armstrongs(param)
        add_to_db(@result, param)
    else
        tmp_res = Result.find_by(param: param)

        if tmp_res.res.end_with?("!")
            @result = tmp_res.res
        else
            @result = tmp_res.res[1..-2].split(', ')
        end
    end
  end
end
