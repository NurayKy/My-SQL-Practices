
-- STAJ TAKİP SİSTEMİ - SELECT Sorguları


USE StajTakipDB;
GO


-- SORGU 1:
-- Geçen yıl her departmanında en az 3 staj ilanı
-- vermiş şirketler için bu seneki tüm ilanlarının:
--   • Toplam başvuru sayısı
--   • Kabul edilen başvuru sayısı
--   • Reddedilen başvuru sayısı
--   • Ortalama değerlendirme puanı
-- (Başvuru yapılmayanlar da dahil)


SELECT
    S.Sirket_ID,
    S.Sirket_Adi,
    COUNT(DISTINCT B.Basvuru_ID) AS Toplam_Basvuru_Sayisi,
    SUM(CASE WHEN BD.Basvuru_Durumu_Adi = N'Kabul Edildi' THEN 1 ELSE 0 END) AS Kabul_Edilen_Basvuru,
    SUM(CASE WHEN BD.Basvuru_Durumu_Adi = N'Reddedildi' THEN 1 ELSE 0 END) AS Reddedilen_Basvuru,
    AVG(CAST(SP.Sirket_Degerlendirme_Notu AS DECIMAL(5,2))) AS Ortalama_Degerlendirme_Puani
FROM SIRKET S
INNER JOIN SUBE SB ON S.Sirket_ID = SB.Sirket_ID
INNER JOIN STAJ_ILANI SI ON SB.Sube_ID = SI.Sube_ID
    AND YEAR(SI.Yayinlanma_Tarihi) = YEAR(GETDATE())
LEFT JOIN BASVURU B ON SI.Ilan_No = B.Ilan_No
LEFT JOIN BASVURU_DURUMU BD ON B.Basvuru_Durumu_ID = BD.Basvuru_Durumu_ID
LEFT JOIN STAJ_SURECI SP ON B.Basvuru_ID = SP.Basvuru_ID
WHERE S.Sirket_ID IN (
    -- Her departmanında en az 3 ilan vermiş şirketler
    SELECT D.Sirket_ID
    FROM DEPARTMAN D
    LEFT JOIN (
        -- Geçen yıl en az 3 ilana sahip departmanlar
        SELECT IDP.Departman_ID
        FROM ILAN_DEPARTMAN IDP
        INNER JOIN STAJ_ILANI SI2 ON IDP.Ilan_No = SI2.Ilan_No
        WHERE YEAR(SI2.Yayinlanma_Tarihi) = YEAR(GETDATE()) - 1
        GROUP BY IDP.Departman_ID
        HAVING COUNT(*) >= 3
    ) GecenYilDep ON D.Departman_ID = GecenYilDep.Departman_ID
    GROUP BY D.Sirket_ID
    HAVING COUNT(D.Departman_ID) > 0
       AND COUNT(D.Departman_ID) = COUNT(GecenYilDep.Departman_ID)
)
GROUP BY S.Sirket_ID, S.Sirket_Adi;


-- SORGU 2:
-- Hem A hem de B sertifikasına sahip öğrencilerin:
--   • Ad, Soyad
--   • Bu seneki toplam katıldıkları etkinlik sayısı
--   • Geçen seneki toplam katıldıkları etkinlik sayısı
-- Bu yılki etkinlik sayısına göre büyükten küçüğe sıralı.
-- Koşullar:
--   • Bu yıl geçen yıldan daha fazla etkinliğe katılmış olmalı
--   • Bu yılki etkinlik sayısı en az 5 olmalı


SELECT
    O.Ad,
    O.Soyad,
    SUM(CASE WHEN YEAR(E.Yapildigi_Tarih) = YEAR(GETDATE()) THEN 1 ELSE 0 END)
        AS Bu_Yil_Etkinlik_Sayisi,
    SUM(CASE WHEN YEAR(E.Yapildigi_Tarih) = YEAR(GETDATE()) - 1 THEN 1 ELSE 0 END)
        AS Gecen_Yil_Etkinlik_Sayisi
FROM OGRENCI O
INNER JOIN OGRENCI_ETKINLIK_ROL OER ON O.Ogrenci_ID = OER.Ogrenci_ID
INNER JOIN ETKINLIK E ON OER.Etkinlik_ID = E.Etkinlik_ID
WHERE O.Ogrenci_ID IN (
    -- Hem A hem B sertifikasına sahip öğrenciler
    SELECT OS.Ogrenci_ID
    FROM OGRENCI_SERTIFIKA OS
    INNER JOIN SERTIFIKA SER ON OS.Sertifika_ID = SER.Sertifika_ID
    WHERE SER.Sertifika_Adi IN (N'A', N'B')
    GROUP BY OS.Ogrenci_ID
    HAVING COUNT(DISTINCT SER.Sertifika_Adi) = 2
)
GROUP BY O.Ogrenci_ID, O.Ad, O.Soyad
HAVING
    SUM(CASE WHEN YEAR(E.Yapildigi_Tarih) = YEAR(GETDATE()) THEN 1 ELSE 0 END) >= 5
    AND SUM(CASE WHEN YEAR(E.Yapildigi_Tarih) = YEAR(GETDATE()) THEN 1 ELSE 0 END) >
        SUM(CASE WHEN YEAR(E.Yapildigi_Tarih) = YEAR(GETDATE()) - 1 THEN 1 ELSE 0 END)
ORDER BY Bu_Yil_Etkinlik_Sayisi DESC;
