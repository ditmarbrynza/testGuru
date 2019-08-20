class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show]

  def show
    render inline: '<%= @question.title %>'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

end