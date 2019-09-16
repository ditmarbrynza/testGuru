module TestPassagesHelper

  def result(test_passage)
    all_questions = test_passage.test.questions.count.to_i
    right_questions = @test_passage.correct_questions.to_i

    percent = right_questions * 100.0 / all_questions

    return 'success', percent if percent >= 85
    return 'error', percent if percent < 85
  end


end
