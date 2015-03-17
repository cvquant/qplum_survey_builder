require_dependency "survey_builder/application_controller"

module SurveyBuilder
  class ResponsesController < ApplicationController
    before_action :set_survey_form!
    before_action :set_response, only: [:show, :edit, :update, :destroy]

    # GET /responses
    def index
      @responses = Response.all
    end

    # GET /responses/1
    def show
    end

    # GET /responses/new
    def new
      @response = Response.new
    end

    # GET /responses/1/edit
    def edit
    end

    # POST /responses
    def create
      @response = Response.new(response_params)

      if @response.save
        redirect_to @response, notice: 'Response was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /responses/1
    def update
      if @response.update(response_params)
        redirect_to @response, notice: 'Response was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /responses/1
    def destroy
      @response.destroy
      redirect_to responses_url, notice: 'Response was successfully destroyed.'
    end

    private
      
      # Use callbacks to share common setup or constraints between actions.
      def set_survey_form!
        @survey_form = SurveyForm.find(params[:survey_form_id])
      end

      def set_response
        @response = Response.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def response_params
        params.require(:response).permit(:question_id, :user_id, :answer_data, :time)
      end
  end
end
