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
        self.postComment(self.comment);
    };

    self.postComment = function(comment) {
      $.ajax({
          type: 'POST',
          url: 'index.json',
          data: comment,
          success: function() {
              console.log('success!');
          }
      });
    };

    self.incrementLikes = function(bulb, likes, bulbId) {
      self.newLike = likes+1;
      bulb.show = true;

      console.log(bulb);

      $.ajax({
        type: 'PATCH',
        url: "index",
        data: bulbId,
        success: function() {
          console.log('success!');
        }
      });
    };

    this.loadBulbs();
}]);
