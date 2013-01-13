desc "This task will update matches with new information"
task :update_matches => :environment do
  puts "Updating matches..."
  Match.update_matches
  puts "Done!"
end