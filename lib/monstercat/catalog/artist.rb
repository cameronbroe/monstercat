module Monstercat
	module Catalog
		class Artist
			def initialize
				@client = Monstercat::Catalog.client
			end

			def all(options = {})
				@client.class.get("#{@client.endpoint}/artist", @client.process_options(options))
			end

			def find(id, options = {})
				@client.class.get("#{@client.endpoint}/artist/#{id}", @client.process_options(options))
			end

			def releases(id, options = {})
				@client.class.get("#{@client.endpoint}/artist/#{id}/releases", @client.process_options(options))
			end
		end
	end
end