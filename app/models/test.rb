class Test < ApplicationRecord

  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

 
  
  scope :all_test_titles, -> (category) { joins(:category).where(categories: { title: category} ).order("categories.title DESC") }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  def self.all_test_titles(category)
    all_test_titles(category).pluck(:title)
  end
  
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: -1 }
  validates :title, uniqueness: { scope: :level }
end
