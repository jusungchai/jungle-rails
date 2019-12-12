require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(id: 1, name: "daily use")
      @product = Product.new(name: "Anything", price: 20, quantity: 5, category: @category)
    end

    it "is valid with all fields" do
      expect(@product).to be_valid
    end

    it "is not valid with no name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end  

    it "is not valid with no price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end   

    it "is not valid with no quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end  

    it "is not valid with no category" do
      @product.category = nil
      expect(@product).to_not be_valid      
    end
  end
end
