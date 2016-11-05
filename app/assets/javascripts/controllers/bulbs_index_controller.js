angular.module('standupApp').controller('BulbsIndexController', ["$http", "getBulbsService", function($http, getBulbsService) {

    var self = this;

    var currentBulb = getBulbsService.get();

    this.loadBulbs = function() {
        currentBulb.then(function(response) {
            console.log(response);
            self.allBulbs = response;
        });
    };

    self.comment = {
        comment: '',
        bulb_id: ''
    };

    self.addComment = function(comment, bulbId) {
        self.comment.comment = comment;
        self.comment.bulb_id = bulbId;
        self.postComment(this.bulb);
    };

    self.postComment = function(bulb) {
      $.ajax({
          type: 'POST',
          url: 'index',
          data: bulb,
          success: function() {
              console.log('success!');
          }
      });
    };

    self.incrementLikes = function(bulb, likes, bulbId) {
      self.newLike = likes+1;
      bulb.show = true;
    };

    this.loadBulbs();
}]);
