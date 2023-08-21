# frozen_string_literal: true

module SpinaSearch
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_files
        directory 'views', Rails.root.join('app/views/spina/search')
      end
    end
  end
end
