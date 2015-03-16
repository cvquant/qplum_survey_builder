module SurveyBuilder
  class SurveyForm < ActiveRecord::Base
  	has_many	:questions
	validates	:name, :presence => true

	# Fields required in SurveyForm
	# string:name
	# timestamp: created_at 
	# timestamp: updated_at
	# integer: points # Number of points for this survey
  end
end
