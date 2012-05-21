
namespace :data do
  task :picture => :environment do
    categories = Dir[Rails.root.to_s+'/home/work/app/*'].map{ |f| File.basename(f) }
    categories.each do |category|
      names = Dir[Rails.root.to_s+"/home/work/app/#{category}/**/*.jpg"].map{ |f| File.basename(f) }
      names.each do |name|
        puts name
        Picture.create(:name => name, :logo => File.open(Rails.root.to_s+"/home/work/app/#{category}/#{name}"), :category => category, :like => false, :count_like => 0)
      end
    end
  end
end
