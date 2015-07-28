// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// $(document).ready(function(){
//     $(".new_workout").on('click', function(event) {
//       event.preventDefault();

//       $.ajax({
//           type: 'POST',
//           success: function() {
//             alert("hello")
//           }
//       });

//       });
//     });

var formAjax = {
  init: function() {
    $('#new_workout').on('ajax:success', this.appendForm);
    $('#new_workout').on('ajax:error', this.displayError);
  },

  appendForm: function() {
    console.log(arguments)
  },
  displayError: function() {
    console.log(arguments)
  }
}
$(document).ready(function() {
  formAjax.init();
//   $('#new_workout').on('submit', function(event){
//       event.preventDefault();
//       $form = $(event.target);

//       $.ajax({
//       url: $form.serialize(),
//       type: 'post'
//       // data: {"tweet[content]": $textarea.val(), "hashtags": hashtags}
//     }).done(function(response){
//       console.log(response)
//   })
// })
})