angular.module('standupApp').controller('BulbsIndexController', function($q, bulbs) {
  this.message = 'in bulbs index controller';

  $q.when(bulbs.get()).then(function(response) {
    console.log(response);
  });
});
