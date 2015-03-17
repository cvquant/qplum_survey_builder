require_dependency "survey_builder/application_controller"

module SurveyBuilder
  class QuestionsController < ApplicationController
    before_action :set_survey_form!
    before_action :set_question! , only: [:show, :edit, :update, :destroy]

    # GET /questions
    def index
      @questions = Question.find(survey_form: @survey_form)
    end

    # GET /questions/1
    def show
    end

    # GET /questions/new
    def new
      @question = Question.new(survey_form: @survey_form)
    end

    # GET /questions/1/edit
    def edit
    end

    # POST /questions
    def create
      @question = Question.new(question_params, survey_form: @survey_form)

      if @question.save
        redirect_to survey_form_question_path(@survey_form.id, @question.id), notice: 'Question was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /questions/1
    def update
      if @question.update(question_params)
        redirect_to survey_form_question_path(@question.survey_form_id, @question.id), notice: 'Question was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /questions/1
    def destroy
      @question.destroy
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_survey_form!
        @survey_form = SurveyForm.find(params[:survey_form_id])
      end
      
      def set_question!
        @question = Question.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def question_params
        params.require(:question).permit(:name, :question_title, :type, :question_data, :answer_specs, :position)
      end
  end
end
