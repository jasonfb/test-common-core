class Hello < ApplicationRecord


  belongs_to :user

  composed_of :temperature, mapping: %w(reading celsius)

end