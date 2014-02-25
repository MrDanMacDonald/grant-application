
desc "Bills users whose next payment date equals today's date"
task :daily_biller => :environment do
  Tasks::DailyBiller.new.run
end