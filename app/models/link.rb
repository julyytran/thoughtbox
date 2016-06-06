class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validates :url, :url => true
  validates :read, presence: true
end
