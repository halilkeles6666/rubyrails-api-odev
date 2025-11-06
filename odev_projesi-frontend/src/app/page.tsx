// src/app/page.tsx
// "use client" -> Bu dosyanın tarayıcıda çalışacağını (interaktif olacağını) belirtir
"use client";

import { useState } from 'react';

// TypeScript için API'dan gelen verinin tipini tanımlayalım
type Book = {
  id: number;
  title: string;
  author_id: number;
  genre_id: number;
};

// Ana Sayfa Bileşeni (Component)
export default function Home() {

  // Kitap listesini tutmak için bir "state" (durum) tanımlıyoruz
  const [books, setBooks] = useState<Book[]>([]);

  // Yüklenme durumunu ve hataları yönetmek için state'ler
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // BUTONA tıklandığında çalışacak fonksiyon
  const handleListBooks = async () => {
    setIsLoading(true); // Yükleme başlıyor
    setError(null);

    try {
      // Backend (Rails) sunucumuza istek atıyoruz
      const res = await fetch('http://localhost:3001/api/v1/books');

      if (!res.ok) {
        throw new Error('API dan veri çekilemedi');
      }

      const data = await res.json();
      setBooks(data); // Gelen veriyi "books" state'ine kaydet

    } catch (err) {
      setError('Kitaplar yüklenirken bir hata oluştu.');
      console.error(err);
    } finally {
      setIsLoading(false); // Yükleme bitti (başarılı ya da hatalı)
    }
  };

  return (
    <main style={{ padding: '2rem' }}>

      <h1>Kütüphane Ana Sayfası</h1>

      <hr />

      {/* Cypress testinin aradığı BUTON */}
      <button
        onClick={handleListBooks}
        disabled={isLoading}
      >
        {isLoading ? 'Yükleniyor...' : 'Kitapları Listele'}
      </button>

      {/* Hata mesajı alanı */}
      {error && <p style={{ color: 'red' }}>{error}</p>}

      {/* Kitap Listesi Alanı */}
      <h2>Kitap Listesi:</h2>
      <ul>
        {/* Başlangıçta (books state'i boşken) burası boş olacak */}

        {/* Cypress testinin aradığı "Dune" YAZISI, butona basılınca buraya gelecek */}
        {books.map((book) => (
          <li key={book.id}>
            {book.title}
          </li>
        ))}
      </ul>
    </main>
  );
}