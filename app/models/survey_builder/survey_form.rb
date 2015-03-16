module SurveyBuilder
  class SurveyForm < ActiveRecord::Base
  	has_many	:questions
  	has_many	:survey_responses
	validates	:name, :presence => true

	# Fields required in SurveyForm
	# string:name
	# timestamp: created_at 
	# timestamp: updated_at
	# integer: points # Number of points for this survey
  end
end
