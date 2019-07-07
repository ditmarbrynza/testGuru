class Test < ApplicationRecord

  has_many :questions
  belongs_to :category
  # has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def self.all_test_titles(category)
    self.joins("JOIN categories ON tests.category_id = categories.id").where(categories: { title: category} ).order("categories.title DESC").pluck("tests.title")
  end

end
