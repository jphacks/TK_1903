# frozen_string_literal: true

# real reapberrypi user
# User.create!(macaddr: 'b8:27:eb:20:c5:a7', zipcode: '113-0033')

100.times do |i|
  User.create!(macaddr: "ff:ff:ff:ff:ff:#{i.to_s.rjust(2, '0')}", zipcode: '113-0033')
end
