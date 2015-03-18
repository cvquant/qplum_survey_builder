require_dependency "survey_builder/application_controller"

module SurveyBuilder
  class SurveyResponsesController < ApplicationController
    before_action :set_survey_form!
    before_action :set_survey_response, only: [:show, :edit, :update, :destroy]

    helper :all

    # GET /survey_responses
    def index
      @survey_responses = @survey_form.survey_responses
    end

    # GET /survey_responses/1
    def show
    end

    # GET /survey_responses/new
    def new
      @questions = @survey_form.questions
      @survey_response = @survey_form.survey_responses.build(survey_form: @survey_form)
      @answers = []
      @questions.each do |question|
        Rails.logger.info "\n\n\n\n\nThere are some questions \n"
        answer = @survey_response.answers.build(question: question)
        @answers.push(answer)
      end
      Rails.logger.info "\n\n\n\n\n\nSurvey Response answers count : #{@survey_response.answers.size} \n\n\n\n\n\n"
    end

    # GET /survey_responses/1/edit
    def edit
    end

    # POST /survey_responses
    def create
      @survey_response = @survey_form.survey_responses.build(survey_response_params)

      if @survey_response.save
        redirect_to survey_form_survey_response_path(@survey_form, @survey_response), notice: 'Survey response was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /survey_responses/1
    def update
      if @survey_response.update(survey_response_params)
        redirect_to survey_form_survey_response_path(@survey_form, @survey_response), notice: 'Survey response was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /survey_responses/1
    def destroy
      @survey_response.destroy
      redirect_to survey_form_survey_responses_path(@survey_form), notice: 'Survey response was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_survey_form!
        @survey_form = SurveyForm.find(params[:survey_form_id])
      end

      def set_survey_response
        @survey_response = SurveyResponse.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def survey_response_params
        params[:survey_response][:user_id] = current_user.id
        params[:survey_response][:survey_form_id] = @survey_form.id
        params.require(:survey_response).permit(:survey_form_id, :user_id, :time_to_answer, answers_attributes: [:question_id, :answer_data, :time_to_answer])
      end
  end
end
