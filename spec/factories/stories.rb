FactoryGirl.define do
  factory :story do
    author 'Вася Пупкин'
    title 'Птички'
    text 'Тут какой-то текст'

    factory :magic_story do
      author 'Гендальф'
      title 'Волшебные птички'
      magic true
    end
  end
end