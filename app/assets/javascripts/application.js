// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
// require bootstrap
//= require bootstrap/affix
//= require bootstrap/alert
//= require bootstrap/button
// require bootstrap/carousel
//= require bootstrap/collapse
//= require bootstrap/dropdown
//= require bootstrap/tab
//= require bootstrap/transition
// require bootstrap/scrollspy
//= require bootstrap/modal
//= require bootstrap/tooltip
// require bootstrap/popover
//= require twitter/bootstrap/rails/confirm
//= require_tree .

$.fn.twitter_bootstrap_confirmbox.defaults = {
    fade: true,
    title: "Player1",
    cancel: "Cancel",
    cancel_class: "btn cancel",
    proceed: "OK",
    proceed_class: "btn proceed btn-primary"
};

$(document).on("ready page:change", function() {
  // Tooltips on top when mobile device, left otherwise.
  var side = $("body.mobile").length ? "top" : "left";
  $(".tooltips").tooltip({ placement: side });

  // FIXME: This doesn't actually set the value in the file field.
  // Clicking on image should trigger form file field.
  // $(".img-artist-picture").click(function() {
  //   $("#artist_picture").click();
  // });
});
