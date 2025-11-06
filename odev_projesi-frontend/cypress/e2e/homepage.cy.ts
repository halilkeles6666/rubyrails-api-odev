// cypress/e2e/homepage.cy.ts

describe('Ana Sayfa - API Entegrasyon Testi (İnteraktif)', () => {
    it('Kullanıcı butona tıkladığında backend API dan kitap listesini çekmeli', () => {

        // GIVEN (Diyelim ki)
        // Kullanıcı Frontend ana sayfasını ziyaret eder
        cy.visit('http://localhost:3000');

        // AND (Ve)
        // Başlangıçta, "Dune" kitabının ekranda OLMADIĞINI doğrula
        // (Henüz API çağrılmadı)
        cy.contains('Dune').should('not.exist');

        // WHEN (Eylem)
        // "Kitapları Listele" adını verdiğimiz butonu bul ve tıkla
        // (TDD: Bu buton henüz var olmadığı için test burada KIRMIZI/FAIL olacak)
        cy.get('button').contains('Kitapları Listele').click();

        // THEN (O zaman)
        // Şimdi, API çağrısı yapılmış olmalı ve "Dune"
        // ekranda GÖRÜNÜR olmalı.
        cy.contains('Dune').should('be.visible');

    });
});