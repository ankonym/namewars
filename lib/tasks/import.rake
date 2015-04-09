require 'csv'

desc "Import names from csv file"

task import: :environment do 
	file = "db/allnamesnew.csv"

	CSV.foreach(file, headers:true) do |row|
		Kidsname.create ({
			:name => row[0],
			:gender => row[1],
			:rank => row[2],
			:score => row[3],
			:count => row[4]
		})
end
end