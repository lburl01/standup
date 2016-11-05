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
  // console.log(self.comment);

  $.ajax({
  type: 'POST',
  url: 'bulbs/index',
  data: self.comment,
  success: function() {
    console.log('success!');
  }
});

};

this.loadBulbs();
}]);
