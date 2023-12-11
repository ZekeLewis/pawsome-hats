// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import 'jquery';
import 'jquery-ujs';

import "@hotwired/turbo-rails"
import "controllers"

import "@popperjs/core"
import "bootstrap"
import autosize from "autosize"

import './custom_hat';
import './validate';



document.addEventListener("turbo:load", () => {
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
  const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
  const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
})

document.addEventListener("turbo:load", () => {
  autosize(document.querySelectorAll('textarea'))
})
