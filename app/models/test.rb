class Test < ApplicationRecord

  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :all_test_titles, -> (category) { joins(:category).where(categories: { title: category }) }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  def self.all_tests_name_titles(category)
    all_test_titles(category).order("categories.title DESC").pluck(:title)
  end
  
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: -1 }
  validates :title, uniqueness: { scope: :level }
end
