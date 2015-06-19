class Address < ActiveRecord::Base
	belongs_to :user
	
	before_create :generate_hash

	def generate_hash
	  self.mask = SecureRandom.hex(4)
	end

	def email
		"#{self.mask}@mailed.cf"
	end

  def to_param
    mask
  end
end
