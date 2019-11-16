class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    @test.user_id = current_user.id
    if @test.save
      redirect_to admin_test_url(@test)
    else
      render :new
    end

  end

  def update

    if @test.update(test_params)
      redirect_to admin_test_url(@test)
    else
      render :edit
    end
  end

  def destroy

    @test.destroy
    redirect_to admin_tests_path
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def start
    @user = current_user
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end 

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_all_test
    @all_tests = Test.all
  end

  def rescue_with_test_not_found
    render plain: "Test was not Found"
  end

end
