class Address < ActiveRecord::Base
	belongs_to :user

	before_create :generate_email

  def generate_email
    self.email = SecureRandom.hex(4)
  end
end
