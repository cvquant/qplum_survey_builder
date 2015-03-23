module SurveyBuilder
  module Questions
  	module RadioHelper

  		def default_min_inputs
  			0
  		end
  		def default_max_inputs
  			10
  		end

  		def render_radio(answer)
  			if answer
  				question = answer.question 
  			else
  				return 
  			end
  			qid = question.id  			
  			question_data = question.parse_question_data        
  			content_tag(:div, :class => "question_form") do
	  			question_data.each_with_index.collect do |data, index|            
	  				concat render_sub_radio(index, data, qid)
	  			end
	  		end  			
  		end

  		def render_sub_radio(index, data, qid)        
  			content_tag(:div, :class => "question") do	            
  				if data.has_key?("helper_text")	            
	  				concat content_tag(:p, data["helper_text"]) 
  				end
	          	options = JSON.parse(data["options"])
	  			options.each_with_index do |option, i|	  				
	  				concat radio_button_tag("answer[#{qid}][#{index}]", option)
		            concat label_tag(option)
		            concat simple_format("\n") 
	  			end
	  		end
  		end
  	end
  end
end