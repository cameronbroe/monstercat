module Monstercat
	module Catalog
		class Release
			def initialize
				@client = Monstercat::Catalog.client
			end

			def all(options = {})
				@client.class.get("#{@client.endpoint}/release", @client.process_options(options))
			end

			def find(id, options = {})
				@client.class.get("#{@client.endpoint}/release/#{id}", @client.process_options(options))
			end

			def tracks(id, options = {})
				@client.class.get("#{@client.endpoint}/release/#{id}/tracks", @client.process_options(options))
			end
		end
	end
end