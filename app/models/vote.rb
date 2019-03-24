class Vote < ApplicationRecord
  validates :user, uniqueness: {scope: :requirement}
  belongs_to :user
  belongs_to :requirement
end
