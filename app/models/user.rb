class User < ApplicationRecord

  def completed_tests(level)
    User.select("tests.title").joins("INNER JOIN complited_tests ON complited_tests.user_id = users.id INNER JOIN tests ON tests.id = complited_tests.test_id").where("users.id = #{self.id} AND level = ?", level)
  end

end
