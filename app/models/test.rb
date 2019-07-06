class Test < ApplicationRecord

  def self.all_test_titles(category)
    self.joins("JOIN categories ON tests.category_id = categories.id").where(categories: { title: category} ).order("categories.title DESC").pluck("tests.title")
  end

end
