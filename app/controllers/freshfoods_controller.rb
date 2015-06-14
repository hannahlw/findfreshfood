class FreshfoodsController < ApplicationController
  def index
    @freshfoods = Freshfood.all
  end

  def create 
    zip_code = strong_params[:zip_code]
    @markets = JSON.load(open("http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=#{zip_code}"))
        
    market_array = @markets["results"]
  # binding.pry
     @results = []
    market_array.each do |market|
        details = JSON.load(open("http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=#{market['id']}"))
        name = market["marketname"][3..-1]
        address = details["marketdetails"]["Address"]
        products = details["marketdetails"]["Products"]
        schedule = details["marketdetails"]["Schedule"]
        google_link = details["marketdetails"]["GoogleLink"]   
       @results << eachmarketresults = {name => 
        {:address => address, 
        :products => products, 
        :schedule => schedule,
        :google_link => google_link
        }}
    end
    
  end

private
  def strong_params
    params.permit(:zip_code)
  end

end









