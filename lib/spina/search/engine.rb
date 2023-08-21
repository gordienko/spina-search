# frozen_string_literal: true

require 'spina'
require 'pg'

module Spina
  module Search
    class Engine < ::Rails::Engine
      isolate_namespace Spina::Search

      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = 'search'
          plugin.namespace = 'search'
        end

        ::Spina.config.tailwind_content.concat Spina::Search::Engine.root.glob('app/views/**/*.*')
      end
    end
  end
end
