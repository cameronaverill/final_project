class DishesController < ApplicationController
	def index
		@dishes = Dish.all
	end

	def new
		@dish = Dish.new
	end

	def create
		@dish = Dish.create!
	end

	def show
		@dish = Dish.find_by
end