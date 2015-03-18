module SurveyBuilder
  module QuestionsHelper

  	TYPES = {
  		"checkbox" => SurveyBuilder::Questions::Checkbox,
  		"radio" => SurveyBuilder::Questions::Radio,
  		"ranker" => SurveyBuilder::Questions::Ranker,
  		"text_input" => SurveyBuilder::Questions::TextInput,
  	}

    def get_question_types
      return TYPES
    end

    def get_type_class(type)
      get_question_types[type]
    end

    def get_type_class_name(type)
      get_type_class(type).name
    end

    def get_type_from_class(type_class)
      get_type_from_class_name(type_class.name)
    end

    def get_type_from_class_name(type_class_name)
      type_hash = get_question_types.select{|cname, klass| klass.name == type_class_name}
      return type_hash.keys.first if type_hash
    end


  	def question_layout(question)
  	end




  end
end
