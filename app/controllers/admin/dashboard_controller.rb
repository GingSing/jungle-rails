class Admin::DashboardController < ApplicationController
  
  include AuthenticationConcern
  
  def show
    @products_count = Product.all.count
    @categories_count = Category.all.count
  end
end
