require 'csv'
require_relative '../app/models/url'

class UrlImport
	def self.import(filename=File.dirname(__FILE__) + "/urls.csv")
		csv = CSV.new(File.open(filename))
		csv.first(50000).each do |links|
			# p links = links[0]
			# shorten #u r actually saying that .shorten is a class method u bring an argument called links
			a = links[0][1..-4]
			Url.create(long: a)
		end
	end
end

UrlImport.import