class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.USERNAME, password: Rails.application.secrets.PASSWORD
  def index  
  end
end