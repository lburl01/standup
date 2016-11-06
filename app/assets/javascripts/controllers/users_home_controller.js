angular.module('standupApp').controller('UsersHomeController', ["getBulbsService", function(getBulbsService) {

    this.message = 'in UsersHomeController';

    this.scores = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    this.bulb = {
        bright: '',
        dim: '',
        blocked: '',
        panic_score: '',
    };

    this.getPanicScore = function(score) {
        this.bulb.panic_score = score;
    };

    this.createBulb = function(brightBulb, dimBulb, blocker) {
        $.ajax({
            type: 'POST',
            url: 'home',
            data: this.bulb,
            success: function() {
                // do something?
            }
        });
    };

    this.scrollStats = function() {
        $('html, body').animate({
            scrollTop: $(".statsContainer").offset().top
        }, 500);
    };

    this.scrollHist = function() {
        $('html, body').animate({
            scrollTop: $(".histContainer").offset().top
        }, 500);
    };

    this.scrollTop = function() {
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        return false;
    };

    var self = this;

    var history = getBulbsService.getHist();

    self.getHistory = function() {
        history.then(function(response) {
            // console.log(response);
            self.bulbHist = response;
            self.panicScore(self.bulbHist);
        });
    };

    self.panicScores = [];

    self.panicScore = function(response) {
        response.forEach(function(item) {
            if (item.panic_score === null) {
                item.panic_score = 0;
            }
            var timeString = item.created_at;

            var shortenedTime = timeString.slice(5, 10);

            self.score = {
                score: item.panic_score,
                time: shortenedTime
            };

            self.panicScores.push(self.score);
        });

        self.buildGraph(self.panicScores);

    };

    self.buildGraph = function(scores) {
        for (count = 0; count < scores.length; count++) {
            var width = 0.65 / scores.length * 100 + '%';
            var height = scores[count].score * 40 + 'px';
            var left = 20;

            if (scores[count].score === 0) {
              self.background = 'none';
            } else if (scores[count].score === 1) {
              self.background = "#EBF5FB";
            } else if (scores[count].score === 2) {
              self.background = '#D6EAF8';
            } else if (scores[count].score === 3) {
              self.background = '#AED6F1';
            } else if (scores[count].score === 4) {
              self.background = '#85C1E9';
            } else if (scores[count].score === 5) {
              self.background = '#5DADE2';
            } else if (scores[count].score === 6) {
              self.background = '#3498DB';
            } else if (scores[count].score === 7) {
              self.background = '#2E86C1';
            } else if (scores[count].score === 8) {
              self.background = '#2874A6';
            } else if (scores[count].score === 9) {
              self.background = '#21618C';
            } else if (scores[count].score === 10) {
              self.background = '#1B4F72';
            }

            var bar = $('<li>').attr('class', 'bar').css({
                "height": height,
                "width": width,
                "background": self.background
            }).text(scores[count].time).appendTo('.graphContainer').append('<p>'+ scores[count].score + '</p>');
        }
    };








    self.getHistory();
}]);
