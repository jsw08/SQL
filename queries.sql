-- THEORIE

--(2p) 1. Wat is een database en wat zijn de voordelen van een database?
-- Een database is een bestand waarin je informatie georganiseerd kan opslaan en gebruiken. Dit is heel erg handig voor applicaties want dan kunnen ze bijvoorbeeld gebruiker gegevens zoals email addressen, wachtwoorden en meer op een makkelijke manier opslaan en bewerken.

--(2p) 2. Waar staat SQL voor en wat is SQL?
-- Sequal query language. Het is een syntax om informatie in een database op te roepen, bewerken, verwijderen of in te voegen.

--(2p) 3. Leg uit wat een join doet en wat het effect hiervan is op de data?
-- Met join kan je informatie uit meerdere tables tegelijkertijd oproepen. Op deze manier kan je data goed georganiseerd houden en er makkelijk bij komen.

--(2p) 4. Waarom is een unieke identifier essentieel bij het maken van joins?
-- Zonder een UID weet je niet welke informatie bij welke informatie hoort, en kan je dus ook niet informatie oproepen.

--(2p) 5. Wat is het datatype van ReportsTo in de tabel Employees? Waarom is het dit datatype? Waar verwijst het naar? Leg in je eigen woorden uit wat daar gebeurt.
-- ReportsTo is een integer (nummer). Het is een nummer omdat het referenced naar de EmployeeId, de uid van de table, zo kan je zien wie de manager is van dat persoon. Vaak is de UID een nummer omdat het heel erg makkelijk is om er een aan te maken. Je pakt gewoon de UID van de laatste entry en doet +1.

-- QUERIES

--(2p) 6a. Maak een database-tabel met daarin 3 kolommen, let op de types:
--    - Voornaam
--    - Achternaam
--    - Leeftijd
CREATE TABLE mensen (Voornaam VARCHAR(20), Achternaam VARCHAR(20), Leeftijd INTEGER);

--(2p) 6b. Voeg 3 personen toe aan de database-tabel.
INSERT INTO mensen VALUES ("Jurn", "Wubben", 16), ("Elmar", "Leistra", 16), ("Damian", "Czapnik", 16);
-- SELECT * from tabel;

--(2p) 7. Schrijf een query die de voornaam, achternaam en titel laat zien van alle employees, sorteer op achternaam
SELECT FirstName, LastName, Title FROM employees ORDER BY LastName;

--(2p) 8. Schrijf een query die de InvoiceDate en BillingAddress laat zien van alle Invoices met BillingState ```MassaChusetts (MA)``` en die duurder waren dan 10 euro (HINT: selecteer eerst alles van de Invoices tabel met * zodat je kan zien hoe alles heet en hoe het in de database staat)
SELECT InvoiceDate, BillingAddress FROM invoices WHERE BillingState == "MassaChusetts (MA)" AND Total > 10;

--(2p) 9. Schrijf een query die alle data uit de customers tabel laat zien
SELECT * FROM customers;

--(2p) 10. Laat alle voor- en achternamen zien van employees die in de IT werken, sorteer op naam van stad (aflopend)
SELECT FirstName, LastName FROM employees ORDER BY City;

--(2p) 11 Schrijf een query die TELT hoeveel tracks er zijn die langer dan 10 minuten duren (1 min = 60 sec = 60000 millisec)
SELECT COUNT(TrackId) FROM tracks WHERE Milliseconds > 60000 * 10;

--(2p) 12. Schrijf een query die TELT hoeveel unieke prijzen er voor tracks zijn
SELECT COUNT(DISTINCT UnitPrice) FROM tracks;

--(2p) 13. Schrijf een query die alle voor- en achternamen van Employees laat zien die NIET naar de ```General Manager``` reporten. Je hoeft hier géén join te gebruiken. Je mag gewoon in de tabel kijken en een where gebruiken.
-- SELECT * FROM employees;
-- SELECT FirstName, LastName FROM employees WHERE ReportsTo == 1;

SELECT FirstName, LastName FROM employees WHERE ReportsTo == (SELECT EmployeeId FROM employees WHERE Title == "General Manager" LIMIT 1);

--(2p) 14. Schrijf een query die de naam van de track weergeeft die de minste ruimte in beslag neemt
SELECT Name, MIN(Bytes) FROM tracks; -- Maar hier staat er ook 'Bytes' bij in de query en ik weet niet hoe ik dat moet fixen op deze manier dus dan maar een andere manier.
SELECT Name FROM tracks ORDER BY Bytes LIMIT 1;


--(2p) 15. Schrijf een query die uitrekent hoeveel alle tracks uit het album met de titel ```Frank``` in totaal gezamenlijk kosten, gebruik hierbij een join
SELECT SUM(tracks.UnitPrice) FROM tracks JOIN albums ON albums.AlbumId == tracks.AlbumId WHERE albums.Title == "Frank";

--(2p) 16. Schrijf een query die alle InvoiceDates vindt van customers die uit Nederland komen
-- SELECT * FROM invoices LIMIT 1;
-- SELECT * FROM customers LIMIT 1;
SELECT invoices.InvoiceDate FROM invoices JOIN customers ON invoices.CustomerId == customers.CustomerId WHERE customers.Country == "Netherlands";


--(2p) 17. Schrijf een query die alle tracks vindt die zijn gemaakt door de artiest ```Queen```
SELECT tracks.Name FROM tracks JOIN albums ON tracks.AlbumId == albums.AlbumId JOIN artists ON albums.ArtistId == artists.ArtistId WHERE artists.Name == "Queen";


--(2p) 18. Schrijf een query die alle InvoiceDates vindt, waarbij employee ```Jane Peacock``` heeft geholpen
SELECT invoices.InvoiceDate FROM invoices JOIN customers ON invoices.CustomerId == customers.CustomerId JOIN employees ON customers.SupportRepId == employees.EmployeeId WHERE employees.FirstName == "Jane" AND employees.LastName == "Peacock";

--(2p) 19. Schrijf een query die alle unieke album titels en artiesten namen toont van alle tracks die in het genre 'Rock' vallen.
SELECT DISTINCT albums.Title, artists.Name FROM albums JOIN artists ON albums.ArtistId == artists.ArtistId JOIN tracks ON tracks.AlbumId == albums.AlbumId JOIN genres ON genres.GenreId == tracks.GenreId WHERE genres.Name == "Rock";