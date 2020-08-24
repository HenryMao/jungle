require 'rails_helper'

  RSpec.describe Product, type: :model do
    describe 'Validations' do
      it 'should not be valid without a name' do
        category = Category.new(:name => "Bitch")
        product = Product.new(
        :category => category,
        :quantity => 5,
        :price => 10)
        product.save
        expect(product.errors.full_messages[0]).to eq("Name can't be blank")
      end
      it 'should not be valid without a price' do
        category = Category.new(:name => "Bitch")
        product = Product.new(
        :name => "G",
        :category => category,
        :quantity => 5)
        product.save
        expect(product.errors.full_messages[0]).to be_present
      end
      it 'should not be valid without a quantity' do
        category = Category.new(:name => "Bitch")
        product = Product.new(
        :category => category,
        :name => "f",
        :price => 10)
        product.save
        expect(product.errors.full_messages[0]).to eq("Quantity can't be blank")
      end
      it 'should not be valid without a category' do
        category = Category.new(:name => "Bitch")
        product = Product.new(
        :name => "f",
        :quantity => 12,
        :price => 10)
        product.save
        expect(product.errors.full_messages[0]).to eq("Category can't be blank")
      end
      it 'should be valid' do
        category = Category.new(:name => "Bitch")
        product = Product.new(
        :name => "f",
        :quantity => 12,
        :price => 10,
        :category => category)
        product.save
        expect(product.errors.full_messages[0]).to be_nil
      end
    end
  end


