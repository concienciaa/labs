# CalculatorController controller handles calculations
class CalculatorController < ApplicationController
  def armstong?(numb)
    sum = numb.to_s.chars.sum do |i|
      i.to_i**numb.to_s.size
    end
    sum == numb
  end

  def input; end

  def result
    resultt = []
    n = params[:input_string].to_s.split.first.to_i
    if n <= 0
      @result = 'Wrong input!'
    else
      if n > 6
        @result = 'TOO MUCH'
      else
        resultt = (10**(n-1)...10**n).find_all do |numb|
          armstong?(numb)
        end
        @result = if resultt.any?
                    resultt
                  else
                    'No numbers'
                  end
      end
    end
    @size = resultt.size

    respond_to do |format|
      format.html
      format.json do
        render json:
        {type: @result.class.to_s, value: @result}
      end
    end
  end
end
