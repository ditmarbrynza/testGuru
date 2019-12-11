class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    @user = current_user
    @user.tests.push(@test)
    @time_left = Time.now + @test.timer * 60
    @test.set_time_left(@time_left)
    redirect_to @user.test_passage(@test)
  end 

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: "Test was not Found"
  end

end
