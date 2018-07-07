class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new 
  end

  def create
    question = Question.new(user: current_user, title: params["title"], content: params["content"]) 
    if question.save
      redirect_to questions_path
    else
      render :new
    end
  end

end