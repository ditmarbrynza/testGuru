class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end

  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy

    @question = Question.find(params[:id])
    @question.destroy

    redirect_to test_path(@question.test_id)
  end

  def new
    @question = Question.new
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question was not Found"
    head 404
  end

end
