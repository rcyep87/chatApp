$('#submit-msg').on('click', function () {
  $.ajax({
    url: '/messages',
    dataType: 'JSON',
    method: "POST",
    data: {
      message: {
        msg: $('#message_msg').val(),
        room_id: $('#message_room_id').val(),
        user_id: $('#message_user_id').val()
      }
    },
    success: function (response) {
      $('#message_msg').val('');
      // $('#notice').prepend('<h3>Message Posted!</h3>');
      $('.messages ul').append('<li>' + response.msg + '</li>');
    }
  });
});
