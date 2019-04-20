$(document).on("turbolinks:load", function(){
  var cd = $("#article_no_expiration");
  var field = $("#article_expired_at");

  var changeExpiredAt = function(){
    if (cd.prop("checked"))
      field.hide()
    else {
      field.show()
      }

      cd.bind("click", changeExpiredAt);

      changeExpiredAt();
})
