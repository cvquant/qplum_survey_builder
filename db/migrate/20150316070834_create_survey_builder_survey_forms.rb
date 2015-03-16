class CreateSurveyBuilderSurveyForms < ActiveRecord::Migration
  def change
    create_table :survey_builder_survey_forms do |t|
      t.string :name
      t.integer :points

      t.timestamps null: false
    end
  end
end
