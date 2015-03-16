module SurveyBuilder
    module Questions
        class TextInput < Question

            def set_type
                self.type = self.class.name
            end

            def validate_answer(answer)
                super(answer)
                answer = parse_answer_data(answer)
                question = parse_question_data
                if answer.count >= question["min_inputs"] && answer.count <= question["max_inputs"] 
                    return true
                else
                    return false
                end
            end

            def parse_question_data
                super
                # The format for the json question_data is as follows:
                # It will be an hash with the following format.             
                # {
                #   min_inputs: 1,
                #   max_inputs: 5,
                # }
                # min_inputs and max_inputs are for validation purposes.

                parsed_question = JSON.parse(question_data)
                return parsed_question
            end

            def parse_answer_data(answer)
                super(answer)
                # The answer_data is supposed to be an array of text entered in order.
                parsed_response = JSON.parse(answer.response)
                return parsed_response
            end        
        end
    end
end