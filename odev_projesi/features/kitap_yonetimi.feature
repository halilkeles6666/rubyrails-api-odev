# (Artık "# language: tr" etiketine GEREK YOK)
Feature: Book Management API
  As an API client, I should be able to add
  new books to the library inventory.

Scenario: Creating a new book with valid data
  
  # Given = Ön koşullar
  Given a Author named "Frank Herbert" exists in the database
  And a Genre named "Science Fiction" exists in the database

  # When = Eylem
  When I send a POST request to "/api/v1/books" with the following JSON:
    """
    {
      "book": {
        "title": "Dune",
        "author_id": 1, 
        "genre_id": 1
      }
    }
    """
  
  # Then = Sonuç
  Then the API response status code should be 201
  And the JSON response should include "title" as "Dune"