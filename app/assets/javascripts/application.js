//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require autocomplete-rails
// require twitter/bootstrap
//= require jquery_nested_form
//= require_tree .

// Flash fade
	$(function() {
	   $('.alert-success').fadeIn('normal', function() {
	      $(this).delay(3700).fadeOut();
	   });
	});
	
	$(function() {
	   $('.alert-error').fadeIn('normal', function() {
	      $(this).delay(3700).fadeOut();
	   });
	});
