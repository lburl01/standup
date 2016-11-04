angular.module('standupApp').controller('BulbsIndexController', function($http, getBulbsService) {

var self = this;

var currentBulb = getBulbsService.get();
currentBulb.then(function(response) {
  console.log(response);
  self.allBulbs = response;
});

});
