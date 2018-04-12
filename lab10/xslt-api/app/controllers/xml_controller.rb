class XmlController < ApplicationController

  def index
    find_armstrongs(params[:param].to_i)
    respond_to do |format|
      format.xml { render xml: @result.map { |elem| {elem: elem } }.to_xml }
    end

  end

  private

  def armstong?(numb)
    sum = numb.to_s.chars.sum do |i|
      i.to_i**numb.to_s.size
    end
    sum == numb
  end
  
  def find_armstrongs(n)
    if n > 0 && n <= 7
      @result = (10**(n-1)...10**n).find_all do |numb|
        armstong?(numb)
      end
	else
	  @result = []
    end
  end
end
