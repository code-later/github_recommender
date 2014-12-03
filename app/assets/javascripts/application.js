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
//= require foundation
//= require_tree .

$(function() {$(document).foundation();});

$(window).bind("load", function () {
  var footer = $(".layout--footer");
  var pos = footer.position();
  var height = $(window).height();
  height = height - pos.top;
  height = height - footer.height();
  if (height > 0) {
    footer.css({
      'margin-top': height + 'px'
    });
  }
});

$(document).ready(function() {
    if ($(".job-status").length > 0) {
        setInterval(function() {
            $.getJSON("/import_jobs/" + $(".job-status").data("job-id") + "/job_status", function(data) {
                if (data.status == 'ready') {
                    window.location = data.url;
                }
            });
        }, 1000);
    }
});
