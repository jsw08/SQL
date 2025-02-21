[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gRBNb6cO)
# Toets Databases

Succes met de toets!

Open **queries.sql** en voer de opdrachten uit.

In `db.png` kan je een schema van de hele database zien.

Als je

```python
python run.py
```

in de console uitvoert, kan je het resultaat van je queries zien. Controleer goed of je het goede antwoord hebt gevonden.

## Voorbeelden

| Operatie         | Syntax                                                    |
|------------------|-----------------------------------------------------------|
| **Tabel maken**  | `CREATE TABLE naam (attribuut VARCHAR(50));`             |
| **Data toevoegen** | `INSERT INTO naam VALUES (waarde);`                    |
| **Data selecteren** | `SELECT ... FROM tabelnaam;` |
| **Data filteren** | `SELECT ... FROM tabelnaam WHERE ...;` |
| **Data orderen** | `SELECT ... FROM tabelnaam ORDER BY ... (ASC or DESC);` |
| **Tellen** | `SELECT COUNT(...) FROM ...;` | 
| **Tel unieke waarden** | `SELECT COUNT(DISTINCT ...) from ...;` |
| **Grootste** | `SELECT MAX(...) FROM ...;` |
| **Kleinste** | `SELECT MIN(...) FROM ...;` | 
| **Som** | `SELECT SUM(...) FROM ...;` |


## Joins

```SQL
select albums.title, artists.name
from artists
join albums on artists.artistid = albums.artistid
```



