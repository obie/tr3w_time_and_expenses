Factory.define(:user) do |f|
  f.sequence(:login) {|n| "user#{n}" }
  f.sequence(:email) {|n| "user#{n}@tr3w.com"}
  f.password 'password'
  f.password_confirmation { |u| u.password }
end