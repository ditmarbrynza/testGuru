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

    if percent >= TESS_COMPLETED
      create_completed_test(true, test_passage)
      check_badges(test_passage)
      return 'success', percent 
    elsif percent < TESS_COMPLETED
      create_completed_test(false, test_passage)
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

  def create_completed_test(status, test_passage)
    user_id = test_passage.user.id
    test_id = test_passage.test.id

    completed_test = CompletedTest.where(user_id: user_id, test_id: test_id)

    if completed_test.presence
      completed_test.first.update(status: status, try: completed_test.first.try + 1)
    else
      completed_test = CompletedTest.new(user_id: user_id, test_id: test_id, status: status)
      completed_test.save!
      if completed_test.try == 1
        check_first_try_badge(test_passage)
      end
    end
  end

  def check_first_try_badge(test_passage)
    badge_id = Badge.find_by(title: "First Try Tests").id
    new_badge = test_passage.user.user_badges.new(badge_id: badge_id)
    new_badge.save!
  end

  def check_badges(test_passage)
    user_id = test_passage.user.id
    user_completed_tests = CompletedTest.where(user_id: user_id, status: true)
    badges = Badge.all
    
    badges.each do |badge|
      completed_test_ids = []

      if badge.condition["level"]
        level = badge.condition["level"]
        all_test_ids = find_all_tests_by_level(level)

        user_completed_tests.each do |test| 
          completed_test_ids.push(test.test.id) if test.test.level == level
        end

        completed_test_ids = completed_test_ids.sort

        if completed_test_ids == all_test_ids && !completed_test_ids.empty? && !all_test_ids.empty?
          current_badge = UserBadge.where(user_id: test_passage.user.id, badge_id: badge.id)
          if !current_badge.presence
            new_badge = test_passage.user.user_badges.new(badge_id: badge.id)
            new_badge.save!
          end
        end

      elsif badge.condition["category"]
        category_id = badge.condition["category"]
        all_test_ids = find_all_tests_by_category(category_id)

        user_completed_tests.each do |test| 
          completed_test_ids.push(test.test.id) if test.test.category_id == category_id
        end

        completed_test_ids = completed_test_ids.sort

        if completed_test_ids == all_test_ids && !completed_test_ids.empty? && !all_test_ids.empty?
          current_badge = UserBadge.where(user_id: test_passage.user.id, badge_id: badge.id)
          if !current_badge.presence
            new_badge = test_passage.user.user_badges.new(badge_id: badge.id)
            new_badge.save!
          end
        end
      end
    end
    
  end

  def find_all_tests_by_level(level)
    test_ids = []
    tests = Test.where(level: level)
    tests.each do |test|
      test_ids.push(test.id)
    end
    test_ids.sort
  end

  def find_all_tests_by_category(category_id)
    test_ids = []
    tests = Test.where(category_id: category_id)
    tests.each do |test|
      test_ids.push(test.id)
    end
    test_ids.sort
  end

end
