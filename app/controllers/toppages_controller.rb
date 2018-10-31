class ToppagesController < ApplicationController
  def index
   @areas = []
      results = JpPrefecture::Prefecture.all
#binding.pry
      results.each do |result|
        area = Item.new(read(result))
        @areas << area
      end
  end
  
  private

  def read(result)
    #code = result.code
    name = result.name
    area = result.area
    {
      #code: code,
      name: name,
      area: area,
    }
  end
end
