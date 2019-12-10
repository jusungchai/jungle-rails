class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def show
    @total_product_count = Product.sum(:quantity)
    @total_category_count = Product.distinct.count(:category_id)
  end
end
