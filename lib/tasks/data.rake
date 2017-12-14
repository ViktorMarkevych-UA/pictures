namespace :data do
task picture: :environment do
   categories = Dir[Rails.root.to_s + '/db/images/*'].map{ |f| File.basename(f) }
   categories.each do |category|
     names = Dir[Rails.root.to_s + "/db/images/#{category}/*.jpeg"].map{ |f| File.basename(f) }
     category_id = Category.find_or_create_by(name: category).id
     names.each do |name|
       # puts name
       Picture.create(name: name, image: File.open(Rails.root.to_s + "/db/images/#{category}/#{name}"), category_id: category_id)
     end
   end
end
end
