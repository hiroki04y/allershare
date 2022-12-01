// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import "controllers"
import "custom/main"

Rails.start();
//= require jquery
//= require jquery_ujs