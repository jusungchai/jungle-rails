class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def index  
  end
end