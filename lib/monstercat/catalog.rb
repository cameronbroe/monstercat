module Monstercat
	module Catalog
		@client = Client.new("catalog")

		def self.client
			@client
		end
	end
end