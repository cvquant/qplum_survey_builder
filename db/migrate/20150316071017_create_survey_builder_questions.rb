class CreateSurveyBuilderQuestions < ActiveRecord::Migration
  def change
    create_table :survey_builder_questions do |t|
      t.references :survey_form
      t.string :name
      t.text :question_title
      t.string :type
      t.json :question_data
      t.json :answer_specs
      t.integer :position
      t.timestamps null: false
    end

    add_index :survey_builder_questions, :survey_form_id
  end
end
