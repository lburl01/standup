angular.module('standupApp').controller('BulbsIndexController', ["$http", "getBulbsService", function($http, getBulbsService) {

var self = this;

var currentBulb = getBulbsService.get();

this.loadBulbs = function() {
  currentBulb.then(function(response) {
    console.log(response);
    self.allBulbs = response;
  });
};

this.loadBulbs();
}]);
