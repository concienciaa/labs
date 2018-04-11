def armstong?(numb)
    sum = numb.to_s.chars.each{|i| i.to_i}.sum do |i|
      i**i
    end
    sum == numb
  end

  def output
    n = 8
    result = (10...10**n).find_all do |numb|
      armstong?(numb)
    end
    result = if result.any?
      result
    else
      'No numbers'
    end
  end
  
puts output