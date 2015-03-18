module SurveyBuilder
  module QuestionsHelper

  	TYPES = {
  		"checkbox" => SurveyBuilder::Questions::Checkbox,
  		"radio" => SurveyBuilder::Questions::Radio,
  		"ranker" => SurveyBuilder::Questions::Ranker,
  		"text_input" => SurveyBuilder::Questions::TextInput,
  	}

  	def question_layout(question)
  	end




  end
end
