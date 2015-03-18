require_dependency "survey_builder/application_controller"

module SurveyBuilder
  class QuestionsController < ApplicationController
    before_action :set_survey_form!
    before_action :set_question! , only: [:show, :edit, :update, :destroy]

    # GET /questions
    def index
      @questions = @survey_form.questions
    end

    # GET /questions/1
    def show
    end

    # GET /questions/new
    def new
      get_type_from_request
      @question = @survey_form.questions.build(survey_form: @survey_form)
    end

    # GET /questions/1/edit
    def edit
      get_type_from_request
    end

    # POST /questions
    def create      
      @question = @survey_form.questions.build(question_params)

      if @question.save
        # Rails.logger.info "Saved question with id - #{@question.id} in survey_form "
        redirect_to survey_form_question_path(@survey_form, @question), notice: 'Question was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /questions/1
    def update
      if @question.update(question_params)
        redirect_to survey_form_question_path(@survey_form, @question), notice: 'Question was successfully updated.'
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
      def get_type_from_request
        @qtype = @types[params[:type]] || Object.const_get(Question.find(params[:id]).type)
        qtype_cname = @types.select{|cname, class_name| class_name == @qtype } if @qtype
        @qtype_cname = qtype_cname.keys[0] if qtype_cname
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_survey_form!
        @survey_form = SurveyForm.find(params[:survey_form_id])
        @types = SurveyBuilder::QuestionsHelper::TYPES
      end
      
      def set_question!
        @question = @survey_form.questions.find(params[:id])
      end      

      # Only allow a trusted parameter "white list" through.
      def question_params
        @class_obj = @types[params['question']["type"]] if @types.has_key?(params['question']["type"])      
        unless @class_obj
          raise SurveyBuilder::BadInput
        end        
        filter_params = params
        filter_params[:question][:type] = @class_obj.name
        filter_params[:question][:question_data] = @class_obj.construct_question_data(filter_params[:question][:question])
        filter_params[:question][:answer_specs] = @class_obj.construct_answer_specs(filter_params[:question][:question])
        Rails.logger.info "\n\n\n filter_params  - #{filter_params} \n\n\n"
        filter_params = filter_params.require(:question).permit(:name, :question_title, :type, :question_data, :answer_specs, :position)
        # We should parse the params here itself for creating question_data and answer_specs.
        return filter_params
      end      
  end
end
