json.array! @answers do |answer|
	json.qid answer.question.id
	json.question_data answer.question.question_data
	json.type answer.question.type
	json.answer_specs answer.question.answer_specs
	json.position answer.question.position
end