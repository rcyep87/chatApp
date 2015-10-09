$('#newMsg').on('click', function () {
  $.ajax({
    url: '/messages',
    dataType: 'JSON',
    method: "POST",
    data: {
      tweet: {
        message: $('#message_msg').val(),
      }
    },
    success: function (response) {
      $('#message_msg').val('');
      $('.notice').append('<h3>Message Posted!</h3>');
    }
  });
});
