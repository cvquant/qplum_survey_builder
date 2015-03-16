module SurveyBuilder
  class ApplicationController < ::ApplicationController

  	def is_admin!
  		unless can_administer?
  			raise SurveyBuilder::AccessDenied
  		end
  	end
  end
end
