class Passenger < ApplicationRecord
  establish_connection "#{Rails.env}_other".to_sym
end
