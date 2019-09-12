class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test'

  def completed_tests(level)
    tests.where(level: level)
  end

  validates :email, presence: true
end
