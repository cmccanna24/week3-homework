class PlacesController < ApplicationController

	def index
		# @reviews = Review.where("place_id = #{params["id"]}").order("id desc")
		@places = Place.all
	end

	def show
		@place = Place.find_by(:id => params["id"])
		@reviews = Review.where("place_id = #{params["id"]}").order("id desc")
		render "show"
	end

	def delete
		place = Place.find_by(:id => params["id"])
		# raise place.inspect
		place.delete
		redirect_to "/places"
		# render "index"
	end

	def new
		render "new"
	end

	def edit
		@place = Place.find_by(:id => params["id"])
		render "edit"
	end

	def create
		# raise params.inspect
		p = Place.new
		p.title = params["title"]
		p.photo_url = params["photo_url"]
		p.admission_price = params["admission_price"].to_i * 100
		p.description = params["description"]
		p.save
		redirect_to "/places"
	end

	def update
		p = Place.find_by(:id => params["id"])
		p.title = params["title"]
		p.photo_url = params["photo_url"]
		p.admission_price = params["admission_price"].to_i * 100
		p.description = params["description"]
		p.save
		redirect_to "/places"
	end

	def addreview
		r = Review.new
		r.place_id = params["id"]
		r.stars = params["stars"][0].to_i
		r.description = params["review"]
		r.save

		@reviews = Review.where("place_id = #{r.place_id}").order("id desc")
		@place = Place.find_by(:id => params["id"])
		redirect_to "/places/#{params["id"]}"
	end

end