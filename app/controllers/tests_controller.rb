class TestsController < ApplicationController

  #skip_before_action :find_test, only: :show
  before_action :find_test, only: %i[show]
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    # byebug
    # /tests?level=2&lang=ru
    # /tests?data%5Blevel%5D=2&data%5Blang%5D=ru
    # /tests?data%5B%5D%5Blevel%5D=1&data%5B%5Dlevel%5D=2

    # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    respond_to do |format|
      format.html { render plain: 'All tests' }
      format.json { render json: {tests: Test.all} }
    end
  end

  def show
    render inline: '<%= @test.title %>'
  end

  def new

  end

  def create
    test = Test.create(test_params)
    render plain: test.inspect
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
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

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start

    logger.info("Execution time: #{finish * 1000}ms")
  end

  def rescue_with_test_not_found
    render plain: "Test was not Found"
  end

end
