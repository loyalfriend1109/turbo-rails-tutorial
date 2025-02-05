class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  after_update_commit -> { broadcast_replace_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quote_#{id}" }
  after_destroy_commit -> { broadcast_remove_to "quotes" }
end
