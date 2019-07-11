class Answer < ApplicationRecord
  belongs_to :question

  scope :right_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answer_count

  def validate_answer_count
    errors.add(:base) if question.answers.count > 4
  end

end
