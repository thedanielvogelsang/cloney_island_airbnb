FactoryGirl.define do
  factory :experience_image do
    experience

    image_file_name { '/lib/assets/baby_penguin.jpg' }
    image_content_type { 'image/jpg' }
    image_file_size { 1024 }
  end
end
