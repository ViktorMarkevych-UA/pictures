Picture.destroy_all
Category.destroy_all
User.destroy_all
categories = Dir[Rails.root.to_s + '/db/images/*'].map{ |f| File.basename(f) }
user = User.first_or_initialize(email: 'test@test.ts', first_name: 'Test', last_name: 'Test',
                                password: '123456',
                                password_confirmation: '123456')
unless user.persisted?
  user.skip_confirmation!
  user.save
end

categories.each do |category|
  names = Dir[Rails.root.to_s + "/db/images/#{category}/*.jpeg"].map{ |f| File.basename(f) }
  category = Category.find_or_create_by(name: category, user: user)
  puts category.name
  names.each do |name|
    puts name
    p = Picture.new(name: name, image: File.open(Rails.root.to_s + "/db/images/#{category.name}/#{name}"), category: category)
    p.save!

    [2,3,4,5].sample().times do |i|
      Comment.create(body: Faker::Lorem.sentence(i + 1, true), user_id: user.id, picture_id: p.id)
    end
  end
  puts '*'*100
end