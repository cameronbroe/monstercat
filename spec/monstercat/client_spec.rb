require "spec_helper"

RSpec.describe Monstercat do
	it "has a version number" do
		expect(Monstercat::VERSION).not_to be nil
	end
end

RSpec.describe Monstercat::Client, "#process_options" do
	before(:context) do
		@client = Monstercat::Client.new
	end

	it "wraps options hash in object under key :query" do
		example_options = {}

		expected_options = {
			query: {}
		}

		expect(@client.process_options(example_options)).to eq(expected_options)
	end

	context "options has key :fields" do
		it "converts array to comma-delimited string" do
			example_options = {
				fields: ['foo', 'bar', 'other', 'example', 'fields']
			}

			expected_options = {
				query: {
					fields: 'foo,bar,other,example,fields'
				}
			}

			expect(@client.process_options(example_options)).to eq(expected_options)
		end
	end

	context "options has key :ids" do
		it "converts array to comma-delimited string" do
			example_options = {
				ids: [1, 2, 3, 4, 5]
			}
	
			expected_options = {
				query: {
					ids: '1,2,3,4,5'
				}
			}
	
			expect(@client.process_options(example_options)).to eq(expected_options)
		end
	end

	context "options has key :fuzzy" do
		it "converts hash to comma-delimited string" do
			example_options = {
				fuzzy: {
					'foo' => 'bar',
					'fizz' => 'buzz'
				}
			}

			expected_options = {
				query: {
					fuzzy: 'foo,bar,fizz,buzz'
				}
			}

			expect(@client.process_options(example_options)).to eq(expected_options)
		end
	end

	context "options has key :filter" do
		it "converts hash to comma-delimited string" do
			example_options = {
				filter: {
					'foo' => 'bar',
					'fizz' => 'buzz'
				}
			}

			expected_options = {
				query: {
					filter: 'foo,bar,fizz,buzz'
				}
			}

			expect(@client.process_options(example_options)).to eq(expected_options)
		end
	end
end
