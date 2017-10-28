fixture = YAML.load_file('config/fixture/fixture.yml')
FactoryBot.define do
  factory :user do
    email fixture['user_1'][0]['email']
    password fixture['user_1'][1]['password']
  end
end