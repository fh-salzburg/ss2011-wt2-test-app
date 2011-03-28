# test/blueprints.rb
require 'machinist/active_record'
require 'sham'
require 'faker'

# Jeder Task soll einen eigenen Title bekommen
Sham.title  { Faker::Name.name }

Task.blueprint do
  title { Sham.title }
  estimated_length 3
  # oder bei Namensgleichheit zwischen Sham und Attribut einfach:
  # title
end
