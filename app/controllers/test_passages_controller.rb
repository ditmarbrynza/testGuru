class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :check_time_left, only: %i[show update gist]

  def show
    if @test_passage.current_question != nil
      render :show
    else
      redirect_to root_path, notice: t('.no_questions')
    end
  end

  def result

  end

  def update
    if params[:answer_ids]
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    else
      redirect_to test_passage_path(@test_passage), notice: t('.no_answer')
    end
  end

  def gist
    new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call

    if new_gist.success?
      question_title = @test_passage.current_question.body
      current_user.gists.create(question_title: question_title[0..24], url: result.id, question_id: @test_passage.current_question.id).save!

      flash_options = { notice: t('.success') + " #{result.html_url}"}
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_time_left
    redirect_to result_test_passage_path(@test_passage) if time_left?
  end

  def time_left?
    @test_passage.created_at + @test_passage.test.timer * 60 - Time.now <= 0 ? true : false
  end

end
