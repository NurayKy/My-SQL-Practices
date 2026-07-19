
-- STAJ TAKİP SİSTEMİ - Örnek Veri (Test Amaçlı)


USE StajTakipDB;
GO

--  BAĞIMSIZ TABLOLAR

INSERT INTO ULKE VALUES (1, N'Türkiye', N'TR');

INSERT INTO DIL VALUES (1, N'Türkçe');
INSERT INTO DIL VALUES (2, N'İngilizce');

INSERT INTO EGITIM_TURU VALUES (1, N'Lisans');

INSERT INTO PROJE_TURU VALUES (1, N'Web Uygulaması');

INSERT INTO ETKINLIK_TURU VALUES (1, N'Seminer');
INSERT INTO ETKINLIK_TURU VALUES (2, N'Workshop');

INSERT INTO SEKTOR VALUES (1, N'Teknoloji');

INSERT INTO TEKNOLOJI VALUES (1, N'Python');

INSERT INTO STAJ_TURU VALUES (1, N'Zorunlu Staj');

INSERT INTO CALISMA_SEKLI VALUES (1, N'Hibrit');

INSERT INTO BASVURU_DURUMU VALUES (1, N'Kabul Edildi');
INSERT INTO BASVURU_DURUMU VALUES (2, N'Reddedildi');
INSERT INTO BASVURU_DURUMU VALUES (3, N'Beklemede');

INSERT INTO GOREV_POZISYON VALUES (1, N'İK Müdürü');

INSERT INTO ROL VALUES (1, N'Katılımcı');
INSERT INTO ROL VALUES (2, N'Konuşmacı');

INSERT INTO KURUM VALUES (1, N'Udemy');

INSERT INTO YETENEK_TURU VALUES (1, N'Teknik');

INSERT INTO YETENEK VALUES (1, N'Python Programlama', 1);

--  1:N TABLOLAR 

INSERT INTO IL VALUES (1, N'İstanbul', 1);

INSERT INTO ILCE VALUES (1, N'Kadıköy', 1);
INSERT INTO ILCE VALUES (2, N'Beşiktaş', 1);

INSERT INTO UNIVERSITE VALUES (1, N'İstanbul Üniversitesi', 1);

INSERT INTO SIRKET VALUES (1, N'TechCorp', 2010, N'Kadıköy Moda Cad.', N'www.techcorp.com', N'info@techcorp.com', N'02121234567');
INSERT INTO SIRKET VALUES (2, N'DataSoft', 2015, N'Beşiktaş Merkez', N'www.datasoft.com', N'info@datasoft.com', N'02129876543');

INSERT INTO DEPARTMAN VALUES (1, N'Yazılım Geliştirme', 1);
INSERT INTO DEPARTMAN VALUES (2, N'Veri Bilimi', 1);
INSERT INTO DEPARTMAN VALUES (3, N'Pazarlama', 2);

INSERT INTO SUBE VALUES (1, N'Kadıköy Şube', N'Moda Cad. No:5', N'02121111111', N'kadikoy@techcorp.com', 1, 1);
INSERT INTO SUBE VALUES (2, N'Beşiktaş Şube', N'Sinanpaşa Cad.', N'02122222222', N'besiktas@datasoft.com', 2, 2);

-- ETKİNLİKLER: 2026 (bu yıl) ve 2025 (geçen yıl)
INSERT INTO ETKINLIK VALUES (1, N'Yapay Zeka Semineri',    '2026-01-15', N'A Salonu', 1, 1, 1, 1);
INSERT INTO ETKINLIK VALUES (2, N'Python Workshop',        '2026-02-20', N'B Salonu', 1, 1, 2, 1);
INSERT INTO ETKINLIK VALUES (3, N'Veri Bilimi Konferansı', '2026-03-10', N'C Salonu', 1, 1, 1, 1);
INSERT INTO ETKINLIK VALUES (4, N'Kariyer Günü',           '2026-04-05', N'D Salonu', 1, 1, 1, 2);
INSERT INTO ETKINLIK VALUES (5, N'Hackathon',              '2026-05-01', N'E Salonu', 1, 1, 2, 1);
INSERT INTO ETKINLIK VALUES (6, N'DevOps Semineri',        '2026-01-25', N'F Salonu', 1, 1, 1, 1);
INSERT INTO ETKINLIK VALUES (7, N'Blockchain Semineri',    '2025-03-15', N'G Salonu', 1, 1, 1, 1);
INSERT INTO ETKINLIK VALUES (8, N'Cloud Workshop',         '2025-06-20', N'H Salonu', 1, 1, 2, 1);
INSERT INTO ETKINLIK VALUES (9, N'Web Geliştirme',         '2025-09-10', N'I Salonu', 1, 1, 1, 2);

-- ÖĞRENCİLER
INSERT INTO OGRENCI VALUES (1, N'Ahmet', N'Yılmaz', '2000-05-15', N'12345678901', N'05551234567', N'ahmet@email.com', N'Kadıköy', N'sifre123', N'twitter.com/ahmet', N'Erkek', 1);
INSERT INTO OGRENCI VALUES (2, N'Ayşe',  N'Demir',  '2001-03-20', N'98765432109', N'05559876543', N'ayse@email.com',  N'Beşiktaş', N'sifre456', N'', N'Kadın', 2);
INSERT INTO OGRENCI VALUES (3, N'Mehmet',N'Kaya',   '1999-11-10', N'11111111112', N'05551111111', N'mehmet@email.com',N'Kadıköy', N'sifre789', N'', N'Erkek', 1);

INSERT INTO FAKULTE VALUES (1, N'Mühendislik Fakültesi', 1);
INSERT INTO BOLUM VALUES (1, N'Bilgisayar Mühendisliği', 1);
INSERT INTO EGITIM VALUES (1, '2020-09-01', 3.50, NULL, 1, 1);
INSERT INTO PROJE VALUES (1, N'Staj Takip Sistemi', N'Web uygulaması', N'github.com/ahmet/staj', 1, 1);

-- SERTİFİKALAR (A ve B)
INSERT INTO SERTIFIKA VALUES (1, N'A', 1);
INSERT INTO SERTIFIKA VALUES (2, N'B', 1);
INSERT INTO SERTIFIKA VALUES (3, N'C', 1);

INSERT INTO SIRKET_YETKILISI VALUES (N'11111111111', N'Ali', N'Veli', N'ali@techcorp.com', N'05553334455', 1, 1);

-- STAJ İLANLARI: Geçen yıl (2025) - Her departmanda 3 ilan (Şirket 1)
-- Departman 1: Yazılım Geliştirme
INSERT INTO STAJ_ILANI VALUES (1, N'Backend Stajyer 2025',   N'Backend stajı',   N'Kadıköy', N'Aktif', 5, '2025-03-01', '2025-06-01', 1, 1, 1, 1);
INSERT INTO STAJ_ILANI VALUES (2, N'Frontend Stajyer 2025',  N'Frontend stajı',  N'Kadıköy', N'Aktif', 3, '2025-04-01', '2025-07-01', 1, 1, 1, 1);
INSERT INTO STAJ_ILANI VALUES (3, N'Mobil Stajyer 2025',     N'Mobil stajı',     N'Kadıköy', N'Aktif', 2, '2025-05-01', '2025-08-01', 1, 1, 1, 1);
-- Departman 2: Veri Bilimi
INSERT INTO STAJ_ILANI VALUES (4, N'Veri Analizi Stajyer',   N'Veri analizi',    N'Kadıköy', N'Aktif', 4, '2025-03-15', '2025-06-15', 1, 1, 1, 1);
INSERT INTO STAJ_ILANI VALUES (5, N'ML Stajyer 2025',        N'ML stajı',        N'Kadıköy', N'Aktif', 2, '2025-04-15', '2025-07-15', 1, 1, 1, 1);
INSERT INTO STAJ_ILANI VALUES (6, N'BI Stajyer 2025',        N'BI stajı',        N'Kadıköy', N'Aktif', 3, '2025-05-15', '2025-08-15', 1, 1, 1, 1);

-- Bu yılki ilanlar (2026)
INSERT INTO STAJ_ILANI VALUES (7, N'Fullstack Stajyer 2026', N'Fullstack stajı', N'Kadıköy', N'Aktif', 5, '2026-02-01', '2026-05-01', 1, 1, 1, 1);
INSERT INTO STAJ_ILANI VALUES (8, N'DevOps Stajyer 2026',    N'DevOps stajı',    N'Kadıköy', N'Aktif', 3, '2026-03-01', '2026-06-01', 1, 1, 1, 1);
INSERT INTO STAJ_ILANI VALUES (9, N'Data Eng Stajyer 2026',  N'Veri müh stajı',  N'Kadıköy', N'Aktif', 4, '2026-03-15', '2026-06-15', 1, 1, 1, 1);

-- İLAN — DEPARTMAN bağlantıları
-- Geçen yıl Dept 1
INSERT INTO ILAN_DEPARTMAN VALUES (1, 1);
INSERT INTO ILAN_DEPARTMAN VALUES (2, 1);
INSERT INTO ILAN_DEPARTMAN VALUES (3, 1);
-- Geçen yıl Dept 2
INSERT INTO ILAN_DEPARTMAN VALUES (4, 2);
INSERT INTO ILAN_DEPARTMAN VALUES (5, 2);
INSERT INTO ILAN_DEPARTMAN VALUES (6, 2);
-- Bu yıl
INSERT INTO ILAN_DEPARTMAN VALUES (7, 1);
INSERT INTO ILAN_DEPARTMAN VALUES (8, 1);
INSERT INTO ILAN_DEPARTMAN VALUES (9, 2);

-- BAŞVURULAR (Bu yılki ilanlara)
INSERT INTO BASVURU VALUES (1, '2026-02-15', N'Backend deneyimim var',    1, 7, 1);
INSERT INTO BASVURU VALUES (2, '2026-02-20', N'Frontend bilgim var',      2, 7, 2);
INSERT INTO BASVURU VALUES (3, '2026-03-05', N'DevOps öğrenmek istiyorum',1, 8, 1);
INSERT INTO BASVURU VALUES (4, '2026-03-10', N'Veri müh ilgimi çekiyor',  3, 9, 3);
INSERT INTO BASVURU VALUES (5, '2026-03-12', N'Staj yapmak istiyorum',    2, 8, 2);

-- MÜLAKATLAR
INSERT INTO MULAKAT VALUES (1, '2026-03-01', N'10:00', N'İyi performans', N'Başarılı',  N'Online',    1);
INSERT INTO MULAKAT VALUES (2, '2026-03-05', N'14:00', N'Yetersiz',       N'Başarısız', N'Yüz yüze', 2);
INSERT INTO MULAKAT VALUES (3, '2026-03-15', N'11:00', N'Çok iyi',        N'Başarılı',  N'Online',    3);

-- STAJ SÜRECİ (kabul edilenler için)
INSERT INTO STAJ_SURECI VALUES (1, '2026-04-01', '2026-07-01', N'Backend projelerinde çalıştı', 85, 90, N'Verimli süreç', 1, 1, N'11111111111');
INSERT INTO STAJ_SURECI VALUES (2, '2026-04-15', '2026-07-15', N'DevOps pipeline kurulumu',     75, 80, N'Faydalı deneyim', 3, 1, N'11111111111');

-- M:N ARA TABLOLAR 

-- ÖĞRENCİ — SERTİFİKA (Ahmet ve Ayşe hem A hem B'ye sahip)
INSERT INTO OGRENCI_SERTIFIKA VALUES (1, 1, '2024-06-01', '2026-06-01');
INSERT INTO OGRENCI_SERTIFIKA VALUES (1, 2, '2024-09-01', '2026-09-01');
INSERT INTO OGRENCI_SERTIFIKA VALUES (2, 1, '2024-07-01', '2026-07-01');
INSERT INTO OGRENCI_SERTIFIKA VALUES (2, 2, '2024-10-01', '2026-10-01');
INSERT INTO OGRENCI_SERTIFIKA VALUES (3, 1, '2024-08-01', '2026-08-01');

-- ÖĞRENCİ — ETKİNLİK — ROL
-- Ahmet: 6 etkinlik bu yıl (2026), 3 etkinlik geçen yıl (2025)
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 1, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 2, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 3, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 4, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 5, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 6, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 7, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 8, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (1, 9, 1);

-- Ayşe: 5 etkinlik bu yıl (2026), 3 etkinlik geçen yıl (2025)
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (2, 1, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (2, 2, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (2, 3, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (2, 4, 2);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (2, 5, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (2, 7, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (2, 8, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (2, 9, 1);

-- Mehmet: 2 etkinlik bu yıl → koşulu sağlamaz
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (3, 1, 1);
INSERT INTO OGRENCI_ETKINLIK_ROL VALUES (3, 2, 1);

-- ŞİRKET — SEKTÖR
INSERT INTO SIRKET_SEKTOR VALUES (1, 1);
INSERT INTO SIRKET_SEKTOR VALUES (2, 1);

-- ÖĞRENCİ — EĞİTİM
INSERT INTO OGRENCI_EGITIM VALUES (1, 1);
INSERT INTO OGRENCI_EGITIM VALUES (2, 1);

-- ÖĞRENCİ — DİL
INSERT INTO OGRENCI_DIL VALUES (1, 1);
INSERT INTO OGRENCI_DIL VALUES (1, 2);
INSERT INTO OGRENCI_DIL VALUES (2, 1);
