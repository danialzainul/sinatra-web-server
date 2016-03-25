class Url < ActiveRecord::Base

	before_save :shorten

	validates :long, presence: true, uniqueness: true

	validates :long, format:{with:/(http|https)/}

	def shorten
		self.short = SecureRandom.hex(3)
	end

end

# line 5 => validates that the form is filled
# line 7 => checks to make sure that all is found