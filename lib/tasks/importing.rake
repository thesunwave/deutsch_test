require 'csv'

namespace :importing do
  desc 'Import data from csv to DB'
  task :run, [:filename] => :environment do |t, args|
    file = args[:filename]
    CSV.foreach(file, headers: false) do |row|
      Numberplan.create!(
                    prefix: row[1],
                    max_length: row[2],
                    min_length: row[3],
                    usage: row[4],
                    comment: row[5]
      )
    end

  end
end
