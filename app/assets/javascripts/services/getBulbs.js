angular.module('standupApp').service('getBulbsService', getBulbs);

function getBulbs($http) {
  function fetchBulbs() {
    return $http({
      method: "GET",
      url: "http://jservice.io/api/random"
    });
  }

  return {
    get: fetchBulbs
  };
}
