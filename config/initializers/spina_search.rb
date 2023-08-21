# frozen_string_literal: true

Rails.configuration.after_initialize do
  Spina::Page.include Spina::Search::Page
end
