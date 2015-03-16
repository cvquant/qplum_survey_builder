require_dependency "survey_builder/application_controller"

module SurveyBuilder
  class SurveyFormsController < ApplicationController
    before_action :set_survey_form, only: [:show, :edit, :update, :destroy]

    # GET /survey_forms
    def index
      @survey_forms = SurveyForm.all
    end

    # GET /survey_forms/1
    def show
      @questions = @survey_form.questions
    end

    # GET /survey_forms/new
    def new
      @survey_form = SurveyForm.new
    end

    # GET /survey_forms/1/edit
    def edit
    end

    # POST /survey_forms
    def create
      @survey_form = SurveyForm.new(survey_form_params)

      if @survey_form.save
        redirect_to @survey_form, notice: 'Survey form was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /survey_forms/1
    def update
      if @survey_form.update(survey_form_params)
        redirect_to @survey_form, notice: 'Survey form was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /survey_forms/1
    def destroy
      @survey_form.destroy
      redirect_to survey_forms_url, notice: 'Survey form was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_survey_form
        @survey_form = SurveyForm.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def survey_form_params
        params.require(:survey_form).permit(:name, :points)
      end
  end
end
