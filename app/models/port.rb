class Port < ApplicationRecord
    require 'csv'
    
    def self.import(file)
        CSV.foreach (file.path, headers:true) do |row|
            Port.create! row.to_hash
        end
    end
end