Factory.define :user do |f|
  f.sequence(:login) { |n| "bbg-tester#{n}"}
  f.sequence(:email) { |n| "email#{n}@beibeigan.com"}
  f.sequence(:name) { |n| "Name#{n}"}
  f.password "secretpwd"
  f.password_confirmation { |u| u.password}
end

Factory.define :grape do |f|
  f.sequence(:name_cn) { |n| "grape#{n}"}
  f.sequence(:name_en) { |n| "grape_en#{n}"}
  f.alias_cn  "alias name"
  f.description 'grape description'
  f.smell 'grape smells'
end