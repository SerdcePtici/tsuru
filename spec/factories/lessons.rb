FactoryGirl.define do
  factory :lesson do
    title 'Птички'
    pictures_attributes { [attributes_for(:picture)] }
  end
end