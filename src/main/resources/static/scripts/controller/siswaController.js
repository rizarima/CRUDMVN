angular.module('aplikasiDataSiswa')
        .controller('siswaController', function ($scope,siswaService) {
            $scope.hallow = "Hello ";
            $scope.nama = "Test";
            $scope.model = {};
            $scope.isEdit = false;
            
            $scope.tampilkanData = function() {
                siswaService.getSiswaCatatan().success(function (data){
                    $scope.dataServer = data;
                })
            };
            
            $scope.hapus = function (index) {
                $scope.data.splice(index,1);
            };
            
            $scope.simpan = function(data){
                if ($scope.isEdit==true) {
                    $scope.data[$scope.indexEdit] = data;
                }
                else {
                    $scope.data.push(data);
                }
                $scope.clear();
            }
            
            $scope.clear = function() {
                $scope.model = {};
                $scope.isEdit = false;
            }
            
            $scope.tampilkanData = function () {
                siswaService.getSiswaFromDb().success(function (data){
                   $scope.dataServer = data.content; 
                });
            };
            
            $scope.isDataEdit = false;
            $scope.currentSiswa = {};
            $scope.simpanData = function (data) {
                if ($scope.isDataEdit==true) {
                    siswaService.update(data.id,data).success(function (data){
                        alert("Data Berhasil Dirubah");
                        $scope.clearData();
                    }).error(function (){
                        alert("Terjadi kesalahan dalam penyimpanan data");
                    })
                }
                else {
                    siswaService.save(data).success(function (data){
                        alert("Data Berhasil Disimpan");
                        $scope.clearData();
                    }).error(function (){
                        alert("Terjadi kesalahan dalam menyimpan data");
                    })
                }
            }
            
            $scope.hapusData = function(id) {
                siswaService.delete(id).success(function (data){
                    alert("Data berhasil dihapus");
                    $scope.clearData();
                }).error(function (){
                    alert("Terjadi kesalahan dalam penghapusan data");
                })
            }
            
            $scope.editData = function (data){
                $scope.isDataEdit = true;
                $scope.currentSiswa = {};
                $scope.currentSiswa.id = data.id;
                $scope.currentSiswa.nama = data.nama;
                $scope.currentSiswa.nis = data.nis;
                $scope.currentSiswa.tempatLahir = data.tempatLahir;
                $scope.currentSiswa.tanggalLahir = data.tanggalLahir;
                $scope.currentSiswa.alamat = data.alamat;
            };
            
            $scope.clearData = function (){
                $scope.isDataEdit = false;
                $scope.currentSiswa = {};
                $scope.reloadData();
            }
            
            $scope.reloadData = function(){
                siswaService.getSiswaFromDb().success(function (data){
                    $scope.dataServer = data.content;
                })
            }
});