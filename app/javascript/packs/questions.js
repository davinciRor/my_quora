$(document).ready(function () {
  $('.edit-question-link').click( function (e) {
    e.preventDefault();
    $(this).hide();
    var questionId = $(this).parents('.question').data('questionId');
    $('#delete-question-link-' + questionId).hide();
    $('#show-question-link-' + questionId).hide();
    $('form#edit-question-' + questionId).show();
  });
});


