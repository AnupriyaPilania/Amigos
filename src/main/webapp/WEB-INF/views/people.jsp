<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../templates/head-meta.jsp"%>

</head>
<style>
.img-responsive { 
  -webkit-transform: scaleX(2); 
  -moz-transform: scaleX(2);
}
</style>

<script type="text/javascript">
	var myApp = angular.module("myApp", []);
	myApp.factory("FriendService", FriendService);
	FriendService.$inject = [ '$http', '$q' ];
	function FriendService($http, $q) {
		var BASE_URL = 'http://localhost:9001/whatsapp/';
		var service = {};
		service.getAllUsers = getAllUsers;
		service.sendFriendRequset = sendFriendRequset;
		service.getFriends = getFriends;
		return service;
		function getAllUsers() {
			console.log("inside the getallusers service");
			return $http.get(BASE_URL + 'getusers').then(function(response) {
				return response.data;
			}, function(errResponse) {
				return $q.reject(errResponse);
			});
		}
		function getFriends() {
			console.log("inside the getFriends service");
			return $http.get(BASE_URL + 'getfriends').then(function(response) {
				return response.data;
			}, function(errResponse) {
				return $q.reject(errResponse);
			});
		}
		function sendFriendRequset(id) {
			console.log("inside the sendRequst service");
			return $http.post(BASE_URL + 'friendrequest', id).then(
					function(response) {
						return response.data;
					}, function(errResponse) {
						return $q.reject(errResponse);
					});
		}
	}
	myApp.controller("myCtrl", myCtrl);
	myCtrl.$inject = [ "FriendService", "$scope" ];
	function myCtrl(FriendService, $scope) {
		$scope.sendFriendRequset = sendFriendRequset;
	
		getAllUsers();
		getFriends();
	/* 	var arrayText = [];
		$scope.calff = function(item) {
			console.log("next");
			arrayText.push(item);
			console.log(arrayText);
		
		}
		 
	 	$scope.calffff = function() {
			
			 var i=0, len=arrayText.length;
			    for (i; i<=len; i++) {
			    	console.log(arrayText[i]);
			     	  if ($scope.arrayText[i] == true) {
			     		console.log("friend");
			      }
			     	 else{
				     		console.log("send request ");
			     	 }  
			    }
			    
			    $scope.arrayText.length = 0; 
		}   */ 
		function getAllUsers() {
			console.log("in the getallusers");
			FriendService.getAllUsers().then(function(response) {
				$scope.allusers = response;
			}, function(errResponse) {
				console.log('Error fetching Users');
			});
		}
		function getFriends() {
			console.log("in the getfriends");
			FriendService.getFriends().then(function(response) {
				$scope.friends = response;
			}, function(errResponse) {
				console.log('Error fetching Users');
			});
		}
		function sendFriendRequset(FriendId) {
			console.log(FriendId);
			FriendService.sendFriendRequset(FriendId).then(function(response) {
				$scope.status = response.status;
			}, function(errResponse) {
				console.log('Error fetching Users');
			});
			
		}
		
		
	}
	
	var myApp = angular.module('MyApp',[]);
	myApp.directive('myDirective', function() {
	  return {
	    scope: {},
	    link: function(scope) {
	      scope.testing = function() {
	        alert('Directive updated!');
	      }
	    }
	  }
	  
	});
	
	
	</script>

<body ng-app="myApp" ng-controller="myCtrl">

	<%@ include file="../templates/head.jsp"%>

	 <div class="container">
	
		<h2><img ng-src="${pageContext.request.contextPath}/resources/images/27.png" width="50" height="50">people</h2>
	
	
	
	<div align="center" style="width:829; height:40;" >
   <video class="img-responsive" src="${pageContext.request.contextPath}/resources/videos/v1.mp4" type="video/mp4" autoplay loop/>
</div>
	
	
	<%-- 
	<video width="1100" height="200" controls>
  <source src="${pageContext.request.contextPath}/resources/videos/v1.mp4" type="video/mp4">
 <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
</video> --%>
	
	
		
		<%-- <img ng-src="${pageContext.request.contextPath}/resources/images/40.jpg"
						width="1100" height="200"> --%>
 
 <br><br>
		 <div class="col-md-4">
			<div ng-show="status">
				<p class="alert alert-info">
					<b>Success!</b>&nbsp{{status}}<br />
				</p>
			</div>

		<input type="text" class="form-control"
				placeholder="Search for people....." ng-model="searchText">

			<div class="panel-group" ng-show="allusers">
				<div class="panel panel-default"
					ng-repeat="user in allusers | filter:searchText as results"
					style="margin-top: 40px">

					<div class="panel-body">

						<img
							ng-src="
					${pageContext.request.contextPath}/resources/images/{{user.email}}.jpg "
							class="img-circle" style="float: left; margin-right: 20px"
							width="80" height="80"
							onerror="this.src='${pageContext.request.contextPath}/resources/images/user.jpg'"
							width="80" height="80" id="sm_profilepic" /> <span
							style="font-size: x-large">{{user.username}}</span><br>
							
							 <i
							class="fa fa-map-marker" aria-hidden="true"></i>&nbsp&nbsp{{user.city}}

						<div ng-if="user.gender == 'Male'">
							<i class="fa fa-mars" aria-hidden="true"></i> {{user.gender}}
						</div>

						<div ng-if="user.gender == 'Female'">
							<i class="fa fa-venus" aria-hidden="true"></i> {{user.gender}}

						</div>
						<hr />
						<button class="btn btn-success btn-sm"
							ng-click="sendFriendRequset(user.userId);">
							<i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp Send
							Requset
						</button>

						<div ng-repeat="friend in friends">
							
							<div ng-if="(friend.friendId.email == user.email)">

								<span class="badge pull-right">friend</span>
							</div> 
						</div>

						
					</div>
				</div>
				
  
				<!-- if no result is found -->
				<div ng-if="results.length === 0" style="margin-top: 20px">

					<span class="alert alert-info"> <i class="fa fa-info-circle"
						aria-hidden="true"></i>&nbspNo results found...
					</span>

				</div>
			</div>

		</div>
	</div>
 

	<%@ include file="../templates/footer.jsp"%>

</body>

</html>