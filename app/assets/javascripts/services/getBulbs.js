angular.module('standupApp').service('getBulbsService', function($http) {
  function getBulbs() {
      return $http({
        method: "GET",
        url: "/bulbs/index.json"
      }).then(function(response) {
        return response.data;
      });
  }

  function getHistory() {
    return $http({
      method: "GET",
      url: "/users/home.json"
    }).then(function(response) {
      return response.data;
    });
  }
  return {
    get: getBulbs,
    getHist: getHistory
  };

});
