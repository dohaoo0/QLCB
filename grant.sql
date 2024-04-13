--1.	Phân quyền chọn cho người dùng có tên QuyenKH trên đối tượng là CHUYENBAY trên CSDL có tên QLCB
CREATE LOGIN KH
WITH PASSWORD = '123456';
GO

CREATE USER QuyenKH FOR LOGIN KH;
GO

USE QLCB 
Grant SELECT ON CHUYENBAY TO QuyenKH;
GO 

--2.	Phân cho người dùng có tên Nhanvien : 
--INSERT vào bảng CHUYENBAY, 
--DELETE trong bảng KM, 
--UPDATE trong bảng TUYENBAY 

CREATE LOGIN NV
WITH PASSWORD = 'Nhanvien';
GO

CREATE USER Nhanvien FOR LOGIN NV;
GO

GRANT INSERT ON CHUYENBAY TO Nhanvien;
GRANT DELETE ON KM TO Nhanvien;
GRANT UPDATE ON TUYENBAY TO Nhanvien;

--3.Thu hồi quyền SELECT của người dùng có tên QuyenKH trên đối tượng là CHUYENBAY trên CSDL có tên QLCB
REVOKE SELECT ON CHUYENBAY FROM QuyenKH;