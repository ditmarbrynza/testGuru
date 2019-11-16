class Admin::QuestionsController < Admin::BaseController

  skip_before_action :verify_authenticity_token
  before_action :find_test, only: %i[create new index]
  before_action :find_question, only: %i[show destroy update edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_url(@test)
    else
      render :new
    end

  end

  def update

    if @question.update(question_params)
      redirect_to admin_question_url(@question)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    
    @question.destroy

    redirect_to admin_test_path(@question.test_id)
  end

  def new
    @question = @test.questions.new
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
