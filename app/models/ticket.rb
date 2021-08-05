class Ticket < ApplicationRecord
  has_many :purchase_tickets
end
