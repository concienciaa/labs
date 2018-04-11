class ArmstrongController < ApplicationController
  def input; end

  def armstong?(numb)
    sum = numb.to_s.chars.sum do |i|
      i.to_i**numb.to_s.size
    end
    sum == numb
  end

  def output
    result = []
    n = params[:input_string].to_s.split.first.to_i
    if n <= 0
      @result = 'Wrong input!'
    else
      if n >= 8
        @result = 'TOO MUCH'
      else
        result = (10**(n-1)...10**n).find_all do |numb|
          armstong?(numb)
        end
        @result = if result.any?
                    result
                  else
                    'No numbers'
                  end
      end
    end
    @size = result.size
  end
end
