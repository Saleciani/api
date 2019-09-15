# frozen_string_literal: true

class Port < ApplicationRecord
  require 'csv'
  has_many :admins
  include PgSearch::Model
  pg_search_scope :search_the_ports,
                  against: %i[name code city oceaninsightscode latitude longitude bigschedules createdat updatedat porttype hubport oceaninsights],
                  using: {
                    tsearch: { prefix: true } 
                  }
end
