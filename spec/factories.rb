fixture = YAML.load_file('config/fixture/fixture.yml')
FactoryBot.define do
  factory :user do
    email fixture['user_1'][0]['email']
    password fixture['user_1'][1]['password']
  end

  factory :article do
    name 'Test Article'
    description 'This is a Test'
    language
    user
  end

  factory :language do
    name 'Türkçe'
  end

  factory :translated_article do
    language
    article
  end
end
