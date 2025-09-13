CREATE TABLE books(
book_id INT PRIMARY KEY IDENTITY(1,1),
title NVARCHAR(100) NOT NULL,
author NVARCHAR(100) NOT NULL,
published_year INT,
genre NVARCHAR(100),
price DECIMAL(10,2) CHECK(price >= 0),
stock INT CHECK(stock > 0),
added_at DATE
); 

INSERT INTO books (title,author,genre,price,stock,published_year,added_at)
VALUES('Kayıp Zamanın İzinde','M. Proust','roman',129.90,25,1913,'2025-08-20'),
('Simyacı','P. Coelho','roman',89.50,40,1988,'2025-08-21'),
('Sapiens','Y. N. Harari','roman',159.00,18,2011,'2025-08-25'),
('İnce Memed', 'Y. Kemal','roman',99.90,12,1955,'2025-08-22'),
('Körlük', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
('Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
('Hayvan Çiftliği', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
('1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
('Nutuk', 'M. K. Atatürk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
('Küçük Prens', 'A. de Saint-Exupéry', 'çocuk', 69.90, 80, 1943, '2025-08-26'),
('Başlangıç', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
('Atomik Alışkanlıklar', 'J. Clear', 'kişisel gelişim', 129.00, 28, 2018, '2025-09-03'),
('Zamanın Kısa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
('Şeker Portakalı', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
('Bir İdam Mahkûmunun Son Günü', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');

--1. Tüm kitapların title, author, price alanlarını fiyatı artan şekilde sıralayarak listeleyin. 
SELECT title,author,price 
FROM books 
ORDER BY price ASC;

--2. Türü 'roman' olan kitapları A→Z title sırasıyla gösterin. 
SELECT * FROM books
WHERE genre = 'roman'
ORDER BY title ASC;

--3. Fiyatı 80 ile 120 (dahil) arasındaki kitapları listeleyin (BETWEEN). 
SELECT * FROM books
WHERE price BETWEEN 80 AND 120;

--4. Stok adedi 20’den az olan kitapları bulun (title, stock_qty). 
SELECT title,stock
FROM books
WHERE stock < 20;

--5. title içinde 'zaman' geçen kitapları LIKE ile filtreleyin (büyük/küçük harf durumunu not edin).
SELECT * FROM books
WHERE title LIKE '%zaman%';

--6. genre değeri 'roman' veya 'bilim' olanları IN ile listeleyin. 
SELECT * FROM books
WHERE genre IN('roman','bilim');

--7. published_year değeri 2000 ve sonrası olan kitapları, en yeni yıldan eskiye doğru sıralayın. 
SELECT * FROM books
WHERE published_year >= 2000
ORDER BY published_year DESC;

--8. Son 10 gün içinde eklenen kitapları bulun (added_at tarihine göre)
SELECT * FROM books
WHERE added_at >= DATEADD(DAY, -10, CAST(GETDATE() AS DATE));

--9. En pahalı 5 kitabı price azalan sırada listeleyin (LIMIT 5). 
SELECT TOP 5 * FROM books
ORDER BY price DESC;

--10. Stok adedi 30 ile 60 arasında olan kitapları price artan şekilde sıralayın. 
SELECT * FROM books
WHERE stock BETWEEN 30 AND 60
ORDER BY price ASC;