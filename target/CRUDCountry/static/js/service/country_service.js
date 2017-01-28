'use strict';
angular.module('myApp').factory('CountryService', ['$http', '$q', function($http, $q){
	
	var REST_SERVICE_URI = 'http://localhost:8080/CRUDCountry/';
	
	 var factory = {
		        fetchAllCountry: fetchAllCountry,
		        createCountry: createCountry
		       /* updateUser:updateUser,
		        deleteUser:deleteUser*/
		    };
		 
		    return factory;
		   
		    function createCountry(country) {
		        var deferred = $q.defer();
		        $http.post(REST_SERVICE_URI + '/addCountry', country)
		            .then(
		            function (response) {
		                deferred.resolve(response.data);
		            },
		            function(errResponse){
		                console.error('Error while creating Country');
		                deferred.reject(errResponse);
		            }
		        );
		        return deferred.promise;
		    }
		    
		    function fetchAllCountry() {
		        var deferred = $q.defer();
		        $http.get(REST_SERVICE_URI + '/getAllCountries')
		            .then(
		            function (response) {
		                deferred.resolve(response.data);
		            },
		            function(errResponse){
		                console.error('Error while fetching Countries');
		                deferred.reject(errResponse);
		            }
		        );
		        return deferred.promise;
		    }
}]);