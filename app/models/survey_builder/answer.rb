module SurveyBuilder
  class Answer < ActiveRecord::Base
    belongs_to :question
    belongs_to :user
    belongs_to :survey_response

    validates	:question, :presence => true

    before_save :validate_answer


    def get_question_type
  		question.type
  	end	

  	def validate_answer
  		question.validate_answer(self)
  	end

    def to_param
    end

  end
end
