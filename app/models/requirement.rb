class Requirement < ApplicationRecord
  belongs_to :user
  has_many :votes 
  has_many :users, through: :votes
  has_many :comments
  has_many :users, through: :comments

  def positive_votes
    self.votes.where(value: true ).count
  end

  def negative_votes
    self.votes.where(value: false ).count
  end

end
