angular.module('aplikasiDataSiswa', ['ngRoute'])
	.config(function($routeProvider){
		$routeProvider
			.when('/',{
				'templateUrl': 'views/home.html',
				'controller': 'siswaController'
			});
	});
