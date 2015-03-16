module SurveyBuilder
  class Engine < ::Rails::Engine
    isolate_namespace SurveyBuilder
    config.eager_load_paths += %W( #{config.root}/app/models/* )
    config.eager_load_paths += %W( #{config.root}/app/models/questions/* )
  end
end
