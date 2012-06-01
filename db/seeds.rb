# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dir["#{Rails.root}/db/images/*/*"].each do |pic|
  cat = Category.find_or_create_by_name(pic.split('/')[-2])
  Picture.create(:category_id => cat , :pict => File.open(pic))
  puts "Create #{pic}"
end
