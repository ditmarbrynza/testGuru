class User < ApplicationRecord

  def completed_tests(level)
    Test.joins('INNER JOIN complited_tests ON tests.id = complited_tests.test_id').where(complited_tests: { user_id: id }, level: level)
  end

end
