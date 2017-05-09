/// <reference path="angular.min.js" />



var myApp = angular.module('myApp', []);

myApp.controller('MyDemo', function ($scope) {

    $scope.Message = "JAY GANESH";
});

myApp.controller('MyDemo2', function ($scope) {
    $scope.Msg = "JAY GANU";
});

myApp.controller('Cnlr_EmpInfo', function ($scope) {
    $scope.EmpName = "JAYRAJ GOSWAMI";
    $scope.EmpMobile = "99 240 17517";
    $scope.EmpAdd = "MG Road";
});


myApp.controller('Cnlr_FillEmpInfo', function ($scope) {
   
    $scope.firstName = "";
    $scope.lastName = "";
    $scope.fullName = function () {
        return $scope.firstName + " " + $scope.lastName;
    };

});
