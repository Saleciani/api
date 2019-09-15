class Admin < ApplicationRecord
    acts_as_token_authenticatable
    has_many :ports
end
