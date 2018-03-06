require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Model Validating' do


    describe 'Build new category class' do
      category = Category.new(name: "test")
      category.save

      describe "should be valid" do
        product = Product.new(
          name: "TestItem",
          description: "Your item is tested",
          category_id: category.id,
          quantity: "123",
          price: "12312")
        product.save
        it("is valid") do
          example_var = product
          expect(product).to be_valid
        end
      end

      describe "when name" do
        product = Product.new(
        description: "Your item is tested",
        category_id: category.id,
        quantity: "123",
        price: "12312")
        product.save

        it "is missing" do
          expect(product).to_not be_valid
        end
      end

      describe "when price" do
        product = Product.new(
        name: "Test item",
        description: "Your item is tested",
        category_id: category.id,
        quantity: "123")
        product.save

        it "is missing" do
          expect(product).to_not be_valid
        end
      end

      describe "when quantity" do
        product = Product.new(
        name: "Test item",
        description: "Your item is tested",
        category_id: category.id,
        price: "12312")
        product.save

        it "is missing" do
          expect(product).to_not be_valid
        end
      end

      describe "when category" do
        product = Product.new(
        name: "Test item",
        description: "Your item is tested",
        quantity: "123",
        price: "12312")
        product.save

        it "is missing" do
          expect(product).to_not be_valid
        end
      end
    end
  end
end