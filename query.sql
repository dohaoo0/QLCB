USE QLCB
-- Xây dựng thủ tục tra cứu thông tin chuyến bay: Số hiệu chuyến bay, giờ bay, giờ đến, giá vé
CREATE PROCEDURE TraCuuChuyenBay
    @SH_CB VARCHAR(20)
AS
BEGIN
    SELECT SH_CB, GIO_BAY, GIO_DEN, GIA_VE
    FROM CHUYENBAY
    WHERE SH_CB = @SH_CB
END;
GO

EXEC TraCuuChuyenBay 'CB2';

--Cho biết số lượng các chuyến bay có lượng vé đã bán ra bằng 70% lượng vé tối đa
SELECT COUNT(*) AS SLCB
FROM THUCHIEN
WHERE LG_VE_MAX = 0.7 * LG_VE_MAX;

--Thống kê tổng số lượng vé đã bán ra của từng chuyến bay có khuyến mãi
SELECT SH_CB, SUM(LG_VE_MAX)
FROM THUCHIEN
GROUP BY SH_CB
HAVING SH_CB IN (SELECT SH_CB FROM KM_CB);

-- Thống kê tổng số chuyến bay và tổng số vé đã bán ra của các chuyến bay có khuyến mãi
COUNT SELECT(DISTINCT SH_CB), SUM(LG_VE_MAX)
FROM THUCHIEN
WHERE SH_CB IN (SELECT SH_CB FROM KM_CB);


