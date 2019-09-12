require 'csv'
require 'json'
# frozen_string_literal: true
data = File.open("/home/joao/Desktop/samples/airports2.csv").read

puts parsed = CSV.parse(data).to_json
