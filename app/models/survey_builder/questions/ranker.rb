module SurveyBuilder
    module Questions
        class Ranker < Question

            store_accessor :question_data, :helper_text, :options

            def self.construct_question_data(raw_data)                
                return raw_data.permit(:options, :helper_text).to_json                
            end

            def self.construct_answer_specs(raw_data)
                return raw_data[:answer_specs]
            end

            def set_type
                self.type = self.class.name
            end
        	# This is the drag and drop ranker. User needs to arrange their preferences by drag-dropping them.

        	def validate_answer(answer)
            end

            def parse_question_data
                super
                # The format for the json question_data is as follows:
                # It will be an array of choices in a particular order. 
                # {
                # 	helper_text: "Some helper text"
                # 	options : '["Option 1", "Option 2", "Option 3", "Option 4"]'
                # }        

                parsed_question = question_data
                if Hash == parsed_question.class
                    parsed_question = [parsed_question]
                end
                return parsed_question
            end

            def parse_answer_data(answer)
                super(answer)
                # The answer_data is supposed to be an array of ranked indices.
                parsed_response = answer.answer_data
                return parsed_response
            end

            def validate_answer_data(answer)
                super(answer)
                answer = parse_answer_data(answer)
                question = parse_question_data
                opt_count = question["options"].count
                if answer.count == opt_count
                    return true
                else
                    return false
                end
            end

            def format_answer(response)
                # response is supposed to be like {0 => [1,2,3,4] , 1=> [3,2,1]}                 
                resp = {}
                response.each do |index, values|
                    resp[index.to_i] = values.split(',')
                end
                puts "Response - #{resp}"
                return resp

            end

        end
    end
end