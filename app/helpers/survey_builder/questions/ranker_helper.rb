module SurveyBuilder
  module Questions
    module RankerHelper
        
        def render_ranker(answer)
            if answer
                question = answer.question 
            else
                return 
            end
            qid = question.id           
            question_data = question.parse_question_data
            content_tag(:div, :class => "question_form") do
                question_data.each_with_index.collect do |data, index|
                    concat render_sub_rankers(index, data, qid)
                end
            end             
        end

        def render_sub_rankers(index, data, qid)        
            content_tag(:div, "",  :class => "ballot") do               
                concat content_tag(:p, data["helper_text"]) if data.has_key?("helper_text")
                concat hidden_field_tag("answer[#{qid}][#{index}]" , "", :id => "rankdata")
                options = JSON.parse(data["options"])
                options.each_with_index.collect do |option, i|
                    content_tag(:ol , nil, :id => "sortable", :class => "rankings") do 
                        concat content_tag(:li , nil, :id =>"ranking_#{i}" , :class => "ui-state-default ranking") do 
                            content_tag(:span, nil, :id => "ui-icon ui-icon-arrowthick-2-n-s")
                            concat content_tag simple_format(option)
                        end
                    end
                end
            end
        end
    end
  end
end