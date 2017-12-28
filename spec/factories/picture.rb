FactoryBot.define do
  factory :picture do
    name 'test'
    image_file_name { 'test.png' }
    image_content_type { 'image/png' }
    image_file_size { 1024 }
  end

  #   multimedia { fixture_file_upload(Rails.root.join('spec/fixtures/test.png'), 'image/png') }
end
