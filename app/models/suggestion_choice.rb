class SuggestionChoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :work
  belongs_to :suggestion
  has_one :rating, dependent: :destroy
end
