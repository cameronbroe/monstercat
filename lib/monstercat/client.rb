require 'httparty'
module Monstercat
	class Client
		include HTTParty
		base_uri 'connect.monstercat.com'

		API_PREFIX = "api"

		def initialize(endpoint=nil)
			@endpoint ||= endpoint
		end

		def endpoint(endpoint=nil)
			@endpoint ||= endpoint if endpoint

			unless endpoint then
				"/#{API_PREFIX}/#{@endpoint}"
			end
		end

		def process_options(options = {})
			new_options = options
			if options.has_key? :fields then
				if options[:fields].class == Array then
					new_options[:fields] = options[:fields].join(",")
				end
			end

			if options.has_key? :ids then
				if options[:ids].class == Array then
					new_options[:ids] = options[:ids].join(",")
				end
			end

			if options.has_key? :fuzzy then
				if options[:fuzzy].class == Hash then
					new_options[:fuzzy] = options[:fuzzy].to_a.flatten.join(",")
				end
			end

			if options.has_key? :filter then
				if options[:filter].class == Hash then
					new_options[:filter] = options[:filter].to_a.flatten.join(",")
				end
			end

			return { query: new_options }
		end
	end
end