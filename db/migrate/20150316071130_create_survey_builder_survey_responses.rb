class CreateSurveyBuilderSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_builder_survey_responses do |t|
      t.references :survey_form
      t.references :user
      t.integer :time_to_answer

      t.timestamps null: false
    end
    add_index :survey_builder_survey_responses, :survey_form_id
    add_index :survey_builder_survey_responses, :user_id
  end
end
