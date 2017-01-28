<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head> 
	  	 <title>CRUD Country</title>
	  	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     	 <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>  
	</head>
	<body ng-app="myApp">
		<h2>Country & Population</h2>
		
		<div class="generic-container" ng-controller="CountryController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Country Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.country.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="cname">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.country.countryName" id="cname" class="username form-control input-sm" placeholder="Enter country name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.cname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.cname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.cname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="population">Population</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.country.population" id="population" class="form-control input-sm" placeholder="Enter country's Population "/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.country.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Countries </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID.</th>
                              <th>Name</th>
                              <th>Population</th>
                              
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="c in ctrl.countries">
                              <td><span ng-bind="c.id"></span></td>
                              <td><span ng-bind="c.countryName"></span></td>
                              <td><span ng-bind="c.population"></span></td>
                              
                              <!-- <td>
                              <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                              </td> -->
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
		
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      	<script src="<c:url value='/static/js/module/app.js' />"></script>
        <script src="<c:url value='/static/js/service/country_service.js' />"></script>
        <script src="<c:url value='/static/js/controller/country_controller.js' />"></script>
	</body>
</html>
