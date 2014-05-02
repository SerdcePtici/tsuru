FactoryGirl.define do
  factory :comment do
    author 'Маша'
    comment 'Мне всё нравится!!!'
    association :commentable, factory: :story
  end
end