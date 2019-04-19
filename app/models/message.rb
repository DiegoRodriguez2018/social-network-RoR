class Message < ApplicationRecord
  belongs_to :user
  scope :for_display, -> { order(:created_at).last(5) }
end
