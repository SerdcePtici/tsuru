FactoryGirl.define do
  factory :album do
    topic
    title 'Фотографии птичек'
    pictures_attributes { [attributes_for(:picture)] }
  end
end