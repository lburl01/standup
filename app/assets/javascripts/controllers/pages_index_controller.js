angular.module('standupApp').controller('PagesIndexController', function() {
    this.message = 'in PagesIndexController';
    this.scrollBottom = function() {
        $('html, body').animate({
            scrollTop: $(".aboutContainer").offset().top
        }, 500);
    };
    this.scrollTop = function() {
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        return false;
    };
});
