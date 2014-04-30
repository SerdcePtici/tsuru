FactoryGirl.define do
  factory :album do
    topic
    title 'Птички'
    pictures_attributes { [attributes_for(:picture)] }
  end
end