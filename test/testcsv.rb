require 'csv'
ficheiro = CSV.read("airports.csv", headers: true, header_converters: :symbol) 
  
ficheiro.each do |row|
   Id = row[:id]
   Name = row[:name]
   City = row[:city]
   Ocean_insights_code = row[:ocean_insights_code]
   latitude = row[:latitude]
   longitude = row[:longitude]
   bigschedules = row[:bigscgedules]
   created_at = row[:created_at]
   Updated_at = row[:updated_at]
   Port_type = row[:Port_type]
   Hub_port = row[:Hub_port]
   ocean_insights = row[:ocean_insights]
   Code = row[:code]

end