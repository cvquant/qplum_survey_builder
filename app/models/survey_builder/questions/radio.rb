
module SurveyBuilder
    class Radio < Question

        # attr_reader :parsed_question 

        def set_type
            self.type = class.name
        end

        def validate_answer(answer)
            question = parse_question_data
            answer = parse_answer_data(answer)
            answer.each do |key, ans|
                if key >= 0  && key < question.count && 
        end

        def parse_question_data
            super
            # The format for the json question_data is as follows:
            # It will either be an array or an hash.
            # If array, it is supposed to be a list of multiple radio choice questions. Each element of array will be a hash as below.
            # If hash, it is a single question with radio choices.
            # Each hash will be have the following format.
            # {
            #   helper_text: ""
            #   options : ["A", "B", "C"]
            # }

            parsed_question = JSON.parse(question_data)
            if Hash == parsed_question.class
                parsed_question = [parsed_question]
            end
            parsed_question.each_with_index do |question, index|
                question["index"] = index
            end
            parsed_question
        end

        def parse_answer_data(answer)
            super(answer)
            # The answer_data is supposed to be a hash with index being the key and response being the value
            parsed_response = JSON.parse(answer.response)
            return parsed_response
        end
    end
end