require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should be valid when new product has all required fields completed" do
      @category = Category.new(name: "test" )
      @product = Product.new(
        name: "test product", 
        description: "test description", 
        category: @category, 
        quantity: 30, 
        image: "test url", 
        price: 2021)
      expect(@product).to be_valid
    end
    
    it "should not be valid when product name is missing" do
      @category = Category.new(name: "test")
      @product = Product.new( 
        description: "test description", 
        category: @category, 
        quantity: 30, 
        image: "test url", 
        price: 2021)
      expect(@product).to_not be_valid
    end

     it "should not be valid when product price is missing" do
      @category = Category.new(name: "test")
      @product = Product.new(
        name: "test product", 
        description: "test description", 
        category: @category, 
        quantity: 30, 
        image: "test url")
      expect(@product).to_not be_valid
    end

    it "should not be valid when product quantity is missing" do
      @category = Category.new(name: "test")
      @product = Product.new(
        name: "test product", 
        description: "test description", 
        category: @category,  
        image: "test url", 
        price: 2021)
      expect(@product).to_not be_valid
    end

    it "should not be valid when product category is missing" do
      @product = Product.new(
        name: "test product", 
        description: "test description", 
        category: @category, 
        quantity: 30, 
        image: "test url", 
        price: 2021)
      expect(@product).to_not be_valid
    end
  end 
end