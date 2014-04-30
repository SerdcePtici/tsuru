FactoryGirl.define do
  factory :comment do
    author 'Вася Пупкин'
    comment 'Мне всё нравится!!!'
    association :commentable, factory: :story
  end
end