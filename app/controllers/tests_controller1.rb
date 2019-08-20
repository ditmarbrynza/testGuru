class TestsController < ApplicationController

  def index
    # render plain: 'All tests'

    # render html: '<h1>All tests</h1>'.html_safe

    # render json: { tests: [123, 123, 341] }

    # render json: { tests: Test.all }

    # render inline: '<p>My favourite language is: <%= %[ybuR].reverse! %>!</p>'
  
    # render file: 'public/about', layout: false

    # head 204

    # head :no_content

    # byebug

    # render inline: '<%= console %>'

    logger.info(self.object_id)

    respond_to do |format|
      format.html { render plain: 'All tests' }
      format.json { render json: {tests: Test.all} }
    end

  end

  def show
    # render plain: 'Show test'
    byebug
    redirect_to root_path
  end


end
