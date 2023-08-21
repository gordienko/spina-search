# frozen_string_literal: true

module Spina
  class SearchController < Spina::ApplicationController
    layout :set_layout
    before_action :set_page

    def index
      @pages = Spina::Page.search(params[:query], where: { live: true }, page: params[:page], per_page: 20)
    end

    private

    def set_page
      @page = Spina::Page.find_or_create_by(name: 'search') do |page|
        page.title = I18n.t('spina.search.page.title')
        page.view_template = 'show'
        page.link_url = '/search'
        page.deletable = false
      end
      Spina::Current.page = @page
      Spina::Current.page.view_context = view_context
    end

    def set_layout
      "#{current_theme.name}/application"
    end
  end
end
