class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.USERNAME, password: Rails.application.secrets.PASSWORD
  def show
    @total_product_count = Product.sum(:quantity)
    @total_category_count = Product.distinct.count(:category_id)
  end
end
