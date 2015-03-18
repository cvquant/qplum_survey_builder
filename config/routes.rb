SurveyBuilder::Engine.routes.draw do
  resources :survey_forms do

  	get 'results', on: :member

  	resources :questions do 
  		get 'new/:type', to: 'questions#new', as: 'new_typed' , on: :collection
  	end
  	
  	resources :survey_responses
	resources :responses

  end  

end
