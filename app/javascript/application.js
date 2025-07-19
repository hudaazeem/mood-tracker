// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import "controllers"

document.addEventListener("turbo:load", () => {
  const noteField = document.getElementById("note_field");
  const charCount = document.getElementById("char_count");

  if (noteField && charCount) {
    charCount.textContent = `${noteField.value.length} / 200`;
    noteField.addEventListener("input", () => {
      charCount.textContent = `${noteField.value.length} / 200`;
    });
  }
});

