Factory.define(:user) do |f|
  f.login { "user#{Time.now.to_f}" }
  f.email { "user#{Time.now.to_f}@tr3w.com"}
  f.password 'password'
  f.password_confirmation { |u| u.password }
end