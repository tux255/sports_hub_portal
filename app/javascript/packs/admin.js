// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';

require("bootstrap/dist/js/bootstrap")

require("trix")
require("@rails/actiontext")


Rails.start();
Turbolinks.start();
ActiveStorage.start();

window.addEventListener('turbolinks:load', function() {
  const addAnswerButton = document.querySelector('#addAnswerField');
  if (addAnswerButton) {
    window.answersCounter = document.querySelectorAll('[id^="survey_survey_answers_attributes_"').length;
    const surveyAnswers = document.querySelector('#surveyAnswers');

    addAnswerButton.addEventListener('click', function(e) {
      e.preventDefault();
      const line = "<input placeholder='Answer' class='form-control mt-2' type='text' name='survey[survey_answers_attributes][" + window.answersCounter + "][answer]' id='survey_survey_answers_attributes_" + window.answersCounter + "_answer'>";

      surveyAnswers.insertAdjacentHTML('beforeend', line);
      window.answersCounter++
    })
  }


  const CategorySelect = document.querySelector('#categories_ignored');
  const SubCategorySelect = document.querySelector('#team_category_id')
  if (CategorySelect && SubCategorySelect) {
    CategorySelect.addEventListener('change', function() {
      fetch('/admin/categories/' + this.value + '/subcategories')
        .then((response) => {
          return response.json();
        })
        .then((data) => {
          if (data) {
            let options = ''
            for (let key in data) {
              console.log(data[key])
              let subcat = data[key]
              options += `<option value=${subcat.id}>${subcat.title}</option>`
            }

            SubCategorySelect.innerHTML = options
          }
        });
    })
  }
})
