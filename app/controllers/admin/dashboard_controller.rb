class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  #http_basic_authenticate_with name: "Jungle", password: "book"
  
  def show
    @product_count = Product.count
    # TODO:BLAHBLAH
    @category_list = "Hello"
  end
end
