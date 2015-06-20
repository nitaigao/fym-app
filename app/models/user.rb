class User < ActiveRecord::Base
  has_many :addresses
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def new_token!
    SecureRandom.hex(16).tap do |random_token|
      update_attributes encrypted_token: random_token
      Rails.logger.info("Set new token for user #{ id }")
    end
  end
end
