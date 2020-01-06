class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  TESS_COMPLETED = 85

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def get_timer
    self.created_at + self.test.timer * 60 - Time.now
  end

  def result(test_passage)
    all_questions = test_passage.test.questions.count.to_i
    right_questions = self.correct_questions.to_i

    percent = right_questions * 100.0 / all_questions
    badge_service = BadgeService.new(test_passage)

    if percent >= TESS_COMPLETED
      badge_service.create_completed_test(true)
      badge_service.check_badges
      return 'success', percent 
    elsif percent < TESS_COMPLETED
      badge_service.create_completed_test(false)
      return 'error', percent 
    end
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers.count == correct_answers.where(id: answer_ids).count) &&
    correct_answers.count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
