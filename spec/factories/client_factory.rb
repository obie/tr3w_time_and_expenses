Factory.define(:client) do |f|
  f.name { File.read(Rails.root.join('README')).scan(/[\w']+/).rand.titleize }
  f.code { |c| "C#{c.name.upcase}#{Time.now.to_f}" }
end