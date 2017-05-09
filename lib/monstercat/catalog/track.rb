module Monstercat
	module Catalog
		class Track
			def initialize
				@client = Monstercat::Catalog.client
			end

			def all(options = {})
				@client.class.get("#{@client.endpoint}/track", @client.process_options(options))
			end

			def find(id, options={})
				@client.class.get("#{@client.endpoint}/track/#{id}", @client.process_options(options))
			end
		end
	end
end