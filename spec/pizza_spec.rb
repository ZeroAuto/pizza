require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../pizza'

describe Pizza::Pie do
  describe '.initialize' do
    it 'records all of the toppings' do
      toppings= [
        Pizza::Topping.new('mushrooms', vegetarian:true),
        Pizza::Topping.new('pepperoni')
      ]
      pizza= Pizza::Pie.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end

    it "defaults the toppings to cheese only, if the pizza has no toppings" do
      pizza= Pizza::Pie.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end  
  end
  describe '#vegetarian?' do
    context 'all toppings are vegetarian' do
      it 'returns true if all toppings are vegetarian' do
        toppings = [
          Pizza::Toppings.new('mushrooms', vegetarian:true)
          Pizza::Toppings.new('peppers', vegetarian:true)
        ]
        pizza = Pizza::Pie.new(toppings)

        expect(pizza.vegetarian?).to eq(true)
      end
    end
    context 'at least one topping is non vegetarian' do
      it 'returns false if at least one topping is non-vegetarian' do
        toppings = [
          Pizza::Toppings.new('mushrooms', vegetarian:true)
          Pizza::Toppings.new('pepperoni')
        ]
        pizza = Pizza::Pie.new(toppings)

        expect(pizza.vegetarian?).to eq(false)
      end
    end
  end
end

  
 

describe Pizza::Topping do
  describe '.initialize' do
    it "sets the name of the topping" do
      topping = Pizza::Topping.new('olives')

      expect(topping.name).to eq('olives')
    end

    it 'sets whether or not the topping is vegetarian' do
      topping = Pizza::Topping.new 'bell peppers', vegetarian: true
      expect(topping.vegetarian).to eq(true)
    end
  end
end

