class Subscription < ApplicationRecord
  belongs_to :collective
  belongs_to :user
end
