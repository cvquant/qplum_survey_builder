module SurveyBuilder
    module Questions
        class TextInput < Question
            
            store_accessor :question_data, :min_inputs, :max_inputs

            def self.construct_question_data(raw_data)
                Rails.logger.info "#{raw_data}"
                min_inputs = raw_data[:min_inputs]
                max_inputs = raw_data[:max_inputs]                
                question_hash = {:min_inputs => min_inputs , :max_inputs => max_inputs}
                return question_hash.to_json
            end

            def self.construct_answer_specs(raw_data)
                return raw_data[:answer_specs]
            end

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
                parsed_response = answer.answer_data
                return parsed_response
            end        
        end
    end
end