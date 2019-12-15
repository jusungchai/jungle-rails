class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER_NAME'], password: ENV['ADMIN_PASSWORD']
  def show
    @total_product_count = Product.sum(:quantity)
    @total_category_count = Product.distinct.count(:category_id)
  end
end
