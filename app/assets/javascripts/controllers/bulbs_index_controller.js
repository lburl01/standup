angular.module('standupApp').controller('BulbsIndexController', ["$http", "getBulbsService", function($http, getBulbsService) {

    var self = this;

    var currentBulb = getBulbsService.get();

    this.loadBulbs = function() {
        currentBulb.then(function(response) {
            // console.log(response);
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
            // do something?
          }
      });
      location.reload();
    };

    self.incrementLikes = function(bulb, likes, bulbId) {
      self.newLike = likes+1;
      bulb.show = true;

      $.ajax({
        type: 'PATCH',
        url: "increment/" + bulbId,
        data: bulbId,
        success: function() {
          //do something?
        }
      });
    };

    self.toggleLightSwitch = function() {
      self.on = !self.on;
      $('.bulbsContainer').toggleClass('off');
      $('.yellow').toggleClass('yellowOff');
    };
    this.loadBulbs();
}]);
