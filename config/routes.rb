SurveyBuilder::Engine.routes.draw do
  resources :survey_forms do

  	get 'results', on: :member

  	resources :questions
  	resources :survey_responses
	resources :responses

  end  

end
