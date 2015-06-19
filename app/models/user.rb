class User < ActiveRecord::Base
  has_many :addresses

  def new_token!
    SecureRandom.hex(16).tap do |random_token|
      update_attributes encrypted_token: random_token
      Rails.logger.info("Set new token for user #{ id }")
    end
  end
end
