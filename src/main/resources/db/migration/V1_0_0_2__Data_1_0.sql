INSERT INTO siswa (id,nama,nis,tempat_lahir,tanggal_lahir,alamat) VALUES
('1','Rizky','1001','Jakarta','09/09/1999','Jl. Mandala V Rt.07/09'),
('2','Akmal','1002','Jakarta','31/08/2001','Jl. Mandala V Rt.07/09');

INSERT INTO `c_security_role` (`id`,`nama`,`description`) VALUES
('admin','admin','Aplikasi User'),
('user','user','Aplikasi User');

INSERT INTO `c_security_permission` (`id`,`permission_label`,`permission_value`) VALUES
('siswa_update','Edit Siswa','ROLE_SISWA_UPDATE'),
('siswa_view','View Siswa','ROLE_SISWA_VIEW'),
('siswa_create','Create Siswa','ROLE_SISWA_CREATE'),
('siswa_delete','Delete Siswa','ROLE_SISWA_DELETE'),
('user_view','View User','ROLE_USER_VIEW');

INSERT INTO `c_security_role_permission` (`id_role`,`id_permission`) VALUES
('admin','siswa_update'),
('admin','siswa_view'),
('admin','siswa_create'),
('admin','siswa_delete'),
('user','siswa_view'),
('user','user_view'),
('admin','user_view');

INSERT INTO `c_security_user` (`id`,`username`,`password`,`active`,`id_role`) VALUES
('1','admin','admin',true,'admin'),
('2','user','user',true,'user');