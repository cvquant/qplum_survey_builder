module SurveyBuilder
  class Question < ActiveRecord::Base
  	belongs_to	:survey_form , :inverse_of => :questions
	has_many	:answers	
	before_create :set_type

	default_scope { order(:position) } 

	validates	:name, :presence => true

	def self.inherited(child)
		child.instance_eval do 
			def model_name
				Question.model_name
			end			
		end
		super
	end

	def set_type
	    raise "You must override this method in each model inheriting from Question."
	end

	def validate_answer(answer)
	end

	# This is a method which duplicates a questions and saves it to a new survey_form.
	# This can be useful in creating new survey_forms from existing questions.
	def duplicate(survey_form, position)
		clone = self.dup
		clone.survey_form = survey_form
		clone.position = position
		clone.save!
	end

	def parse_question_data
	end

	def parse_answer_data(answer)
	end


	# Schema Definition
	# integer:position 			# position of question in the survey.
	# string:name				# Name id of question
	# string:question_title		# Qquestion Title
	# string:type				# Type of question (radio, checkbox, etc)
	# json:question_data		# JSON representation of the data for the question. Parsing rules for the data will be in the subclasses.
	# json:answer_data			# JSON representation of data relevant to the answer.
  end
end
