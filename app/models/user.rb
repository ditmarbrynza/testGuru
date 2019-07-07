class User < ApplicationRecord

  # has_and_belongs_to_many :tests

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test'

  def completed_tests(level)
    Test.joins('INNER JOIN complited_tests ON tests.id = complited_tests.test_id').where(complited_tests: { user_id: id }, level: level)
  end

end
