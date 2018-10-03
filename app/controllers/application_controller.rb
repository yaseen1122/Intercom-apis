class ApplicationController < ActionController::API

	before_action :set_client
	def set_client
	  @client = Intercom::Client.new(token: "dG9rOmJhYWZmYjdlX2QwNDNfNGM3N184N2ZiX2FkZTJjMWIzNWY1ZjoxOjA=")
	end
end
