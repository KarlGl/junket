module Junket
  class Engine < ::Rails::Engine
    isolate_namespace Junket

    config.generators do |g|
      g.hidden_namespaces << :test_unit
      g.test_framework :rspec
      g.factory_girl dir: 'spec/factories'
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    require 'cancancan'
    require 'active_model_serializers'
  end
end
