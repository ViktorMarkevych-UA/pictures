#namespace :data do
#  task :picture => :environment do
#    categories = Dir[Rails.root.to_s+'/db/images/*'].map{ |f| File.basename(f) }
#    categories.each do |category|
#      names = Dir[Rails.root.to_s+"/db/images/#{category}/*.jpg"].map{ |f| File.basename(f) }
#      names.each do |name|
#        puts name
#        Picture.create(:name => name, :pict => File.open(Rails.root.to_s+"/db/images/#{category}/#{name}"), :category => category)
#      end
#    end
#  end
#end