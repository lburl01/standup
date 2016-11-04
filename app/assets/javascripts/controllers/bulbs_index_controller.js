angular.module('standupApp').controller('BulbsIndexController', function($q) {
    this.message = 'in bulbs index controller';
    // this.bulbs = [];

    this.buildBulbs = function(response) {
        this.bulbs = response;
        console.log(this.bulbs);
    };

    this.getBulbs = function() {
      var self = this;
        $.when($.ajax("index")).then(function(response, textStatus, jqXHR) {
            console.log(jqXHR.status);
            self.buildBulbs(response);
        });
    };

    this.getBulbs();
});
