angular.module('standupApp').controller('BulbsIndexController', function($http, getBulbsService) {

var self = this;
this.test = '';

var currentBulb = getBulbsService.get();
currentBulb.then(function(response) {
  console.log(response);
  this.test = response;
});

console.log(self.test);

});
