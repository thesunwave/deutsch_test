require 'csv'

namespace :importing do
  desc 'Import data from csv to DB'
  task :run, [:filename] => :environment do |t, args|
    file = args[:filename]
    CSV.foreach(file, headers: false) do |row|
      Numberplan.create!(
          prefix: row[0],
          max_length: row[1],
          min_length: row[2],
          usage: row[3],
          comment: row[4]
      )
    end

  end
end
