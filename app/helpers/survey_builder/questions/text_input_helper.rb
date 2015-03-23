module SurveyBuilder
  module Questions
  	module TextInputHelper

  		def default_min_inputs
  			0
  		end
  		def default_max_inputs
  			10
  		end

  		def render_text_input(answer)
  			if answer
  				question = answer.question 
  			else
  				return 
  			end
  			qid = question.id  			
  			question_data = question.parse_question_data
  			content_tag(:div, :class => "question_form") do
	  			question_data.each_with_index.collect do |data, index|
	  				concat render_sub_question(index, data, qid)
	  			end
	  		end  			
  		end

  		def render_sub_question(index, data, qid)  		
  			content_tag(:div, :class => "question") do	  				
	  			@content = content_tag(:p, data["helper_text"]) if data.has_key?("helper_text")
	  			concat content_tag(:p, "Please fill the following fields")
	  			min_inputs = data["min_inputs"].to_i || default_min_inputs
	  			max_inputs = data["max_inputs"].to_i || default_max_inputs
	  			max_inputs.times.each do |i|	  				
	  				concat text_field_tag "answer[#{qid}][#{index}][]"
	  			end
	  			@content
	  		end
  		end
  	end
  end
end