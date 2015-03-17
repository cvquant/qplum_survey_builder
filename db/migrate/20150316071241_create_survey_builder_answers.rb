class CreateSurveyBuilderAnswers < ActiveRecord::Migration
  def change
    create_table :survey_builder_answers do |t|
      t.references :question
      t.references :survey_response
      t.json :answer_data
      t.integer :time_to_answer

      t.timestamps null: false
    end
    add_index :survey_builder_answers, :question_id
    add_index :survey_builder_answers, :survey_response_id
  end
end
