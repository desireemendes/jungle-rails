require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should create a new product with all 4 fields set' do
      @category = Category.new(name: 'testing')
      @product = Product.new(
        name: 'Test product',
        price: 20,
        quantity: 400,
        category: @category
      )
      # puts @product.inspect
      expect(@product).to be_valid
    end

    it 'should not be valid without a name' do
      @category = Category.new(name: 'testing')
      @product = Product.new(
        name: nil,
        price: 20,
        quantity: 400,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end
    
    it 'should not be valid without quantity' do
      @category = Category.new(name: 'testing')
      @product = Product.new(
        name: 'Test product',
        price: 20,
        quantity: nil,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end

    #4 Validates that the product contains a category
    it 'should not be valid without a category' do
      @category = Category.new(name: 'testing')
      @product = Product.new(
        name: 'Test product',
        price: 45.99,
        quantity: 4,
        category: nil
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Category can't be blank"]
    end
    
  end
end