module SurveyBuilder
    module Questions
        class TextInput < Question
            
            store_accessor :question_data, :min_inputs, :max_inputs

            def self.construct_question_data(raw_data)               
                return raw_data.permit(:min_inputs, :max_inputs).to_json                 
            end

            def self.construct_answer_specs(raw_data)
                return raw_data[:answer_specs]
            end

            def set_type
                self.type = self.class.name
            end

            def validate_answer(answer_set)
                super(answer_set)
                answers = parse_answer_data(answer_set)                
                questions = parse_question_data
                questions.each_with_index do |question, index|
                    answer = answers[index.to_s]
                    unless answer.size >= question["min_inputs"].to_i && answer.size <= question["max_inputs"].to_i
                        return false                        
                    end
                end
                return true
            end

            def parse_question_data
                super
                # The format for the json question_data is as follows:
                # It will be array of hashes with each hash having the following format.             
                # {
                #   helper_text : "Some helper text",
                #   min_inputs: 1,
                #   max_inputs: 5,
                # }
                # min_inputs and max_inputs are for validation purposes.

                parsed_question = question_data
                if Hash == parsed_question.class
                    parsed_question = [parsed_question]
                end
                return parsed_question
            end

            def parse_answer_data(answer)
                super(answer)
                # The answer_data is supposed to be an hash of (index, [text]) entered.
                parsed_response = answer.answer_data
                return parsed_response
            end       

            def format_answer(response)                 
                # response is supposed to be like this {"0"=>["A", "B", "C"], "1"=>["D", "E", "F", "G", "H"]}
                resp = {}
                response.each do |index, values|
                    resp[index.to_i] = values
                end
                puts "Resposne - #{resp}"
                return resp
            end
        end
    end
end