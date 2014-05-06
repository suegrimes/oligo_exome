// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

function showHideDiv(elementId1, elementId2) {
  if (document.getElementById) {
    var element1 = document.getElementById(elementId1); //div with link to form
    var element2 = document.getElementById(elementId2); //div with form
    if (element2.style.visibility == 'hidden') {
      element2.style.visibility = 'visible';
      element1.style.visibility = 'hidden';

    } else if (element2.style.visibility == 'visible') {
      element2.style.visibility = 'hidden';

    }
  }
}

