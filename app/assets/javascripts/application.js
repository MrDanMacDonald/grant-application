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
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .



 // $(document).ready(function() {

 // $('#form_id').hide(); //Initially form wil be hidden.

 //  $('#button_id').click(function() {
 //   $('#form_id').show();//Form shows on button click

 //   });
 // });


$(document).ready(function(){
	$('#new_org').hide().prop('disabled', true);
	$('#link_create').click(function(){
		$('#new_org').prop('disabled', false);
		$('#select_org').toggle().prop('disabled', true);		

	});
});