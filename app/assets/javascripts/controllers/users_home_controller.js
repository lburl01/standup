angular.module('standupApp').controller('UsersHomeController', function() {
    this.message = 'in UsersHomeController';

    this.score = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    this.bulb={
      bright: '',
      dim: '',
      blocked: '',
      panic_score: '',
    };

    this.getPanicScore = function(score) {
        this.bulb.panic_score = score;
    };

    this.createBulb = function(brightBulb, dimBulb, blocker) {
        $.ajax({
          type: 'POST',
          url: 'home',
          data: this.bulb,
          success: function() {
            // do something?
          }
        });
    };
});
