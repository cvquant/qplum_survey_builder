class CreateSurveyBuilderResponses < ActiveRecord::Migration
  def change
    create_table :survey_builder_responses do |t|
      t.references :question
      t.references :survey_response
      t.json :answer_data
      t.integer :time_to_answer

      t.timestamps null: false
    end
    add_index :survey_builder_responses, :question_id
    add_index :survey_builder_responses, :survey_response_id
  end
end
