class Tweet < ActiveRecord::Base
  validates :body, :presence => true
  validates :author, :presence => true
  validates :body, length: { maximum: 140 }
end
