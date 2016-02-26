class QuestionsController < ApplicationController

before_action :authorize, only: [:edit]

def index
  @questions = Question.all

end



def show
@question = Question.find(params[:id])

end

def create
Question.create(question_params)


redirect_to root_path

  end

  def edit
@question = Question.find(params[:id])

  end

  def update

    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to root_path @question
    end
  end


  def destroy
@question = Question.find(params[:id])
if @question.destroy
  redirect_to root_path
  end
end




  private

  def question_params

    params.require(:question).permit(:title,:body)



  end
end
