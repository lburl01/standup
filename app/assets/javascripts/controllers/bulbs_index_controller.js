angular.module('standupApp').controller('BulbsIndexController', function(getBulbsService, $q) {

var self = this;
this.allBulbs = '';

$q.when(getBulbsService.get()).then(function(response) {
  self.allBulbs = response.data[0].answer;
  console.log(self.allBulbs);
});

// var self = this;
//     self.message = 'in bulbs index controller';
//     self.bulbs = {
//       bright: 'test'
//     };

// 1. get bulbs with Ajax get
    // self.getBulbs = function() {
    //     $.when($.ajax("index")).then(function(response, textStatus, jqXHR) {
    //         console.log(jqXHR.status);
    //         self.bulbs = response;
    //         console.log(self.bulbs);
    //     });
    // };

// 2. Build bulbs
    // this.buildBulb = function(response) {
    //   this.bulbs = response;
        // for (count = 0; count < this.bulbs.length; count++) {
        //     this.bulb = {
        //         bright: this.bulbs[count].bright,
        //         dim: this.bulbs[count].dim,
        //         blocked: this.bulbs[count].blocked,
        //         author: this.bulbs[count].bulb_writer,
        //         panicScore: this.bulbs[count].panic_score
        //     };
        //     // this.bulbs.push(this.bulb);
        // }
      // return this.bulbs;
    // };

    // this.printBulb = function(bulb) {
    //   return bulb;
    // };

    // this.getBulbs();
});
