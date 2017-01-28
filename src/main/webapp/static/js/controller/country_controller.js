'use strict';
angular.module('myApp').controller('CountryController', ['$scope', 'CountryService', function($scope, CountryService) {
	var self = this;
    self.country={id:null,countryName:'',population:''};
    self.countries=[];
 
    self.submit = submit;
    
    fetchAllCountry();
   
 
    function createCountry(country){
    	CountryService.createCountry(country)
            .then(
            fetchAllCountry,
            function(errResponse){
                console.error('Error while creating Country');
            }
        );
    }
    
    function fetchAllCountry(){
    	CountryService.fetchAllCountry()
            .then(
            function(d) {
                self.countries = d;
            },
            function(errResponse){
                console.error('Error while fetching Countries');
            }
        );
    }
    
    function submit() {
        if(self.country.id===null){
            console.log('Saving New Country', self.country);
            createCountry(self.country);
        }
        reset();
    }
 
    function reset(){
        self.country={id:null,countryName:'',population:''};
        $scope.myForm.$setPristine(); //reset Form
    }
	
}]);