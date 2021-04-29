class Admin::SalesController < ApplicationController

  def index
    @sales = sale.all
  end
end
