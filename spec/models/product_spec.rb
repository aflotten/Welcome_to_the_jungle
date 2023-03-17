require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validates name is present" do
      @category = Category.new(name: 'newCategoryName')
      @product = Product.new(name: "Toothbrush", price: "50.0", quantity: "30", category: @category)
      @product.save
      expect(@product.name).to be_present
    end

    it "validates price is present" do
        @category = Category.new(name: 'newCategoryName')
        @product = Product.new(name: "Socks", price: "9.99", quantity: "1000", category: @category)
        @product.save
        expect(@product.price).to be_present
    end


    it "validates quantity is present" do
      @category = Category.new(name: 'newCategoryName')
      @product = Product.new(name: "Fertilizer", price: "34.79", quantity: "75", category: @category)
      @product.save
      expect(@product.quantity).to be_present
    end


    it "validates category is present" do
      @category = Category.new(name: 'newCategoryName')
      @product = Product.new(name: "Pots", price: "4.99", quantity: "400", category: @category)
      @product.save
      expect(@product.category).to be_present
    end


    it "validates errors.full_messages to be empty array" do
      @category = Category.new(name: 'newCategoryName')
      @product = Product.new(name: "Rakes", price: "25.49", quantity: "66", category: @category)
      @product.save
      expect(@product.errors.full_messages).to eql([])
  end
  end
end
