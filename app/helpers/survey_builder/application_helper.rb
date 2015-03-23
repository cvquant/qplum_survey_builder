module SurveyBuilder
  module ApplicationHelper

  	def parse_json(json_string)
  		return JSON.parse(json_string)
  	end
  end
end
