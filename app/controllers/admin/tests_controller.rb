class Admin::TestsController < Admin::BaseController

  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy start update_inline]

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
    @test = current_user.created_tests.create(test_params)
    if @test.save
      redirect_to admin_test_url(@test), notice: t('.success')
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

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
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

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def rescue_with_test_not_found
    render plain: "Test was not Found"
  end

end
