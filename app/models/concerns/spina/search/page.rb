# frozen_string_literal: true

require 'opensearch-ruby'
require 'searchkick'

module Spina
  module Search
    module Page
      extend ActiveSupport::Concern
      include I18n::Base

      SUPPORTED_PART_TYPES = %w[Spina::Parts::Line Spina::Parts::MultiLine Spina::Parts::Text Spina::Parts::Date Spina::Parts::Datetime Spina::Parts::Option].freeze

      included do
        searchkick

        scope :search_import, -> { includes(:resource, :translations) }

        def search_data
          {
            title:,
            position:,
            created_at:,
            updated_at:,
            live: live?,
            resource_name: resource&.name
          }.merge(custom_fields)
        end

        def custom_fields
          fields = {}
          Spina.config.locales.each do |locale|
            fields.merge!(json_attributes["#{locale}_content"]
                            .select { SUPPORTED_PART_TYPES.include? _1.class.name }.uniq
                            .to_h { |attr| ["#{locale}_#{attr.attributes['name']}", with_locale(locale) { content(attr.attributes['name']) }] })
          end

          fields
        end
      end
    end
  end
end
