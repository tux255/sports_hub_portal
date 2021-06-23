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

window.addEventListener('load', function() {
  console.log('content loaded');
  let addAnswerButton = document.querySelector('#addAnswerField');
  if (addAnswerButton) {
    window.answersCounter = document.querySelectorAll('[id^="survey_survey_answers_attributes_"').length;
    let surveyAnswers = document.querySelector('#surveyAnswers');

    addAnswerButton.addEventListener('click', function(e) {
      e.preventDefault();
      let line = "<input placeholder='Answer' class='form-control mt-2' type='text' name='survey[survey_answers_attributes][" + window.answersCounter + "][answer]' id='survey_survey_answers_attributes_" + window.answersCounter + "_answer'>";

      surveyAnswers.insertAdjacentHTML('beforeend', line);
      window.answersCounter++
    })
  }

})

Rails.start();
Turbolinks.start();
ActiveStorage.start();
