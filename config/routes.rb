SurveyBuilder::Engine.routes.draw do
  resources :survey_forms do

  	get 'results', on: :member

  	resources :questions do 
  		resources :responses
  	end
  	resources :survey_responses

  end  

end
