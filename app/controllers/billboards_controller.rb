class BillboardsController < ApplicationController
	def index
		@billboards = Billboard.limit(10)
	end
end
