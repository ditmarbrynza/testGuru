class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :find_test, only: %i[index]

  before_action :find_question, only: %i[show destroy]
  before_action :find_all_question, only: %i[index]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    @question.destroy
    render inline: 'Question was deleted'
  end

  def new

  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_all_question
    @questions = Question.all
  end

  def rescue_with_question_not_found
    render plain: "Question was not Found"
  end

  def question_params
    params.require(:questions).permit(:body, :test_id)
  end

end