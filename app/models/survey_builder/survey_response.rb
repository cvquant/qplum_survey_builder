module SurveyBuilder
  class SurveyResponse < ActiveRecord::Base
    belongs_to :survey_form
    belongs_to :user
    has_many :answers

    accepts_nested_attributes_for :answers
  end
end
