Factory.define :user do |f|
  f.sequence(:login) { |n| "bbg-tester#{n}"}
  f.sequence(:email) { |n| "email#{n}@beibeigan.com"}
  f.sequence(:name) { |n| "Name#{n}"}
  f.password "secretpwd"
  f.password_confirmation { |u| u.password}
end