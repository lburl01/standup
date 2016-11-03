angular.module('standupApp').controller('BulbsIndexController', function() {
  this.message = 'in bulbs index controller';

this.getBulbs = function() {
  $.get('index', function(response) {
    console.log(response);
    console.log(response[0].comment_data[0].comment);
    console.log('in');
  });
};
  // $q.when(bulbs.get()).then(function(response) {
  //   console.log(response);
  // });
  this.getBulbs();
  
});
