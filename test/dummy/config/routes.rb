Rails.application.routes.draw do

  mount SurveyBuilder::Engine => "/survey_builder"
end
