FactoryGirl.define do
  factory :lesson do
    title 'Как делать птичек'
    pictures_attributes { [attributes_for(:picture)] }
  end
end