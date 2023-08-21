# frozen_string_literal: true

Spina::Engine.routes.draw do
  resources :search, only: 'index'
end
