class AddressesController < ApplicationController
	before_filter :authenticate_user!

	def create
		current_user.addresses.create!
		redirect_to addresses_path
	end

	def index
		@addresses = current_user.addresses.map { |address| "#{address.mask}@mailed.cf" }
	end

	def show 
		@address = Address.find_by!(mask: params[:id])
	end
end
