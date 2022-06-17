  class Adm::QuestionsController < ApplicationController

    respond_to :json

    def index

      @questions = Question.all
      render json:@questions, each_serializer: Api::V1::QuestionAdminSerializer
    end


    def update
      @question = Question.find(params[:id])
      respond_to do |format|
        format.json do
          if @question.update(question_params)
            render :json => @question
          else
            render :json => { :errors => @question.errors.messages }, :status => 422
          end
        end
      end
    end

    def destroy
      Question.find(params[:id]).destroy
      respond_to do |format|
        format.json { render :json => {}, :status => :no_content }
      end
    end

    def create
      @question = Question.new(question_params)
      respond_to do |format|
        format.json do
          if @question.save
            render :json => @question
          else
            render :json => { :errors => @question.errors.messages }, :status => 422
          end
        end
      end
    end

    private

    def question_params
      params.require(:question).permit!
    end

  end
