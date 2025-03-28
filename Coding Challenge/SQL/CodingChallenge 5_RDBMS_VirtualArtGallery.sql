USE CODINGCHALLENGE;
GO
--Create Schema
CREATE SCHEMA Virtual;
-- Create the Artists table
CREATE TABLE Virtual.Artists (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Biography TEXT,
    Nationality VARCHAR(100)
);
-- Insert sample data into the Artists table
INSERT INTO Virtual.Artists (ArtistID, Name, Biography, Nationality) VALUES
(1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
(2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
(3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');
GO

-- Create the Categories table
CREATE TABLE Virtual.Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);
-- Insert sample data into the Categories table
INSERT INTO Virtual.Categories (CategoryID, Name) VALUES
(1, 'Painting'),
(2, 'Sculpture'),
(3, 'Photography');
GO

-- Create the Artworks table
CREATE TABLE Virtual.Artworks (
    ArtworkID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ArtistID INT,
    CategoryID INT,
    Year INT,
    Description TEXT,
    ImageURL VARCHAR(255),
    FOREIGN KEY (ArtistID) REFERENCES Virtual.Artists (ArtistID)ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Virtual.Categories (CategoryID)ON DELETE CASCADE
);
-- Insert sample data into the Artworks table
INSERT INTO Virtual.Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL) VALUES
(1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'),
(2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'),
(3, 'Guernica', 1, 1, 1937, 'Pablo Picassos powerful anti-war mural.', 'guernica.jpg');
GO

-- Create the Exhibitions table
CREATE TABLE Virtual.Exhibitions (
    ExhibitionID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Description TEXT
);
-- Insert sample data into the Exhibitions table
INSERT INTO Virtual.Exhibitions (ExhibitionID, Title, StartDate, EndDate, Description) VALUES
(1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
(2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.');
GO

-- Create a table to associate artworks with exhibitions
CREATE TABLE Virtual.ExhibitionArtworks (
    ExhibitionID INT,
    ArtworkID INT,
    PRIMARY KEY (ExhibitionID, ArtworkID),
    FOREIGN KEY (ExhibitionID) REFERENCES Virtual.Exhibitions (ExhibitionID)ON DELETE CASCADE,
    FOREIGN KEY (ArtworkID) REFERENCES Virtual.Artworks (ArtworkID)ON DELETE CASCADE
);
-- Insert artworks into exhibitions
INSERT INTO Virtual.ExhibitionArtworks (ExhibitionID, ArtworkID) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2);
GO

-- Query 1: Count of artworks by each artist, ordered by number of artworks
SELECT a.Name, COUNT(w.ArtworkID) AS ArtworksCount
FROM Virtual.Artists a
LEFT JOIN Virtual.Artworks w ON a.ArtistID = w.ArtistID
GROUP BY a.Name
ORDER BY ArtworksCount DESC;
GO
-- Query 2: List of artworks by artists from 'Spanish' and 'Dutch' nationalities, ordered by year
SELECT w.Title
FROM Virtual.Artworks w
JOIN Virtual.Artists a ON w.ArtistID = a.ArtistID
WHERE a.Nationality IN ('Spanish', 'Dutch')
ORDER BY w.Year ASC;
--OR
SELECT w.Title
FROM Virtual.Artworks w, Virtual.Artists a 
WHERE w.ArtistID = a.ArtistID AND a.Nationality IN ('Spanish', 'Dutch')
ORDER BY w.Year ASC;
GO
-- Query 3: Count of 'Painting' artworks by each artist
SELECT a.Name, COUNT(w.ArtworkID) AS PaintingCount
FROM Virtual.Artists a
JOIN Virtual.Artworks w ON a.ArtistID = w.ArtistID
JOIN Virtual.Categories c ON w.CategoryID = c.CategoryID
WHERE c.Name = 'Painting'
GROUP BY a.Name;
--OR
SELECT a.Name, COUNT(w.ArtworkID) AS PaintingCount
FROM Virtual.Artists a, Virtual.Artworks w, Virtual.Categories c  
WHERE a.ArtistID = w.ArtistID AND w.CategoryID = c.CategoryID AND c.Name = 'Painting'
GROUP BY a.Name;
GO
-- Query 4: List artworks in the 'Modern Art Masterpieces' exhibition along with artist and category
SELECT w.Title, a.Name AS Artist, c.Name AS Category
FROM Virtual.ExhibitionArtworks ea
JOIN Virtual.Artworks w ON ea.ArtworkID = w.ArtworkID
JOIN Virtual.Artists a ON w.ArtistID = a.ArtistID
JOIN Virtual.Categories c ON w.CategoryID = c.CategoryID
JOIN Virtual.Exhibitions e ON ea.ExhibitionID = e.ExhibitionID
WHERE e.Title = 'Modern Art Masterpieces';
--OR
SELECT w.Title, a.Name AS Artist, c.Name AS Category
FROM Virtual.ExhibitionArtworks ea, Virtual.Artworks w, Virtual.Artists a, Virtual.Categories c, Virtual.Exhibitions e 
WHERE ea.ArtworkID = w.ArtworkID AND w.ArtistID = a.ArtistID AND w.CategoryID = c.CategoryID AND ea.ExhibitionID = e.ExhibitionID
AND e.Title = 'Modern Art Masterpieces';
GO
-- Query 5: Artists with more than 2 artworks
SELECT a.Name
FROM Virtual.Artists a
JOIN Virtual.Artworks w ON a.ArtistID = w.ArtistID
GROUP BY a.Name
HAVING COUNT(w.ArtworkID) > 2;
--OR
SELECT a.Name
FROM Virtual.Artists a, Virtual.Artworks w 
WHERE a.ArtistID = w.ArtistID
GROUP BY a.Name
HAVING COUNT(w.ArtworkID) > 2;
GO
-- Query 6: Artworks exhibited in both 'Modern Art Masterpieces' and 'Renaissance Art'
SELECT w.Title
FROM Virtual.ExhibitionArtworks ea
JOIN Virtual.Artworks w ON ea.ArtworkID = w.ArtworkID
WHERE ea.ExhibitionID IN (1, 2)
GROUP BY w.Title
HAVING COUNT(DISTINCT ea.ExhibitionID) = 2;
--OR
SELECT w.Title
FROM Virtual.ExhibitionArtworks ea, Virtual.Artworks w 
WHERE ea.ArtworkID = w.ArtworkID AND ea.ExhibitionID IN (1, 2)
GROUP BY w.Title
HAVING COUNT(DISTINCT ea.ExhibitionID) = 2;
GO
-- Query 7: Count of artworks by category
SELECT c.Name AS Category, COUNT(w.ArtworkID) AS ArtworkCount
FROM Virtual.Categories c
LEFT JOIN Virtual.Artworks w ON c.CategoryID = w.CategoryID
GROUP BY c.Name;
GO
-- Query 8: Artists with more than 3 artworks
SELECT a.Name
FROM Virtual.Artists a
JOIN Virtual.Artworks w ON a.ArtistID = w.ArtistID
GROUP BY a.Name
HAVING COUNT(w.ArtworkID) > 3;
--OR
SELECT a.Name
FROM Virtual.Artists a, Virtual.Artworks w 
WHERE a.ArtistID = w.ArtistID
GROUP BY a.Name
HAVING COUNT(w.ArtworkID) > 3;
GO
-- Query 9: Artworks by artists with 'Spanish' nationality
SELECT w.Title
FROM Virtual.Artworks w
JOIN Virtual.Artists a ON w.ArtistID = a.ArtistID
WHERE a.Nationality = 'Spanish';
--OR
SELECT w.Title
FROM Virtual.Artworks w, Virtual.Artists a 
WHERE w.ArtistID = a.ArtistID AND a.Nationality = 'Spanish';
GO
-- Query 10: Exhibitions with artworks by both Vincent van Gogh and Leonardo da Vinci
SELECT e.Title
FROM Virtual.Exhibitions e
JOIN Virtual.ExhibitionArtworks ea ON e.ExhibitionID = ea.ExhibitionID
JOIN Virtual.Artworks w ON ea.ArtworkID = w.ArtworkID
JOIN Virtual.Artists a ON w.ArtistID = a.ArtistID
WHERE a.Name IN ('Vincent van Gogh', 'Leonardo da Vinci')
GROUP BY e.Title
HAVING COUNT(DISTINCT a.Name) = 2;
--OR
SELECT e.Title
FROM Virtual.Exhibitions e, Virtual.ExhibitionArtworks ea, Virtual.Artworks w, Virtual.Artists a 
WHERE e.ExhibitionID = ea.ExhibitionID AND ea.ArtworkID = w.ArtworkID AND w.ArtistID = a.ArtistID
AND a.Name IN ('Vincent van Gogh', 'Leonardo da Vinci')
GROUP BY e.Title
HAVING COUNT(DISTINCT a.Name) = 2;
GO
-- Query 11: Artworks not included in any exhibition
SELECT w.Title
FROM Virtual.Artworks w
LEFT JOIN Virtual.ExhibitionArtworks ea ON w.ArtworkID = ea.ArtworkID
WHERE ea.ExhibitionID IS NULL;
GO
-- Query 12: Artists who have artworks in all available categories
SELECT a.Name
FROM Virtual.Artists a
JOIN Virtual.Artworks w ON a.ArtistID = w.ArtistID
GROUP BY a.Name
HAVING COUNT(DISTINCT w.CategoryID) = (SELECT COUNT(*) FROM Virtual.Categories);
--OR
SELECT a.Name
FROM Virtual.Artists a, Virtual.Artworks w 
WHERE a.ArtistID = w.ArtistID
GROUP BY a.Name
HAVING COUNT(DISTINCT w.CategoryID) = (SELECT COUNT(*) FROM Virtual.Categories);
GO
-- Query 13: Count of artworks by category
SELECT c.Name AS Category, COUNT(w.ArtworkID) AS ArtworkCount
FROM Virtual.Categories c
LEFT JOIN Virtual.Artworks w ON c.CategoryID = w.CategoryID
GROUP BY c.Name;
GO
-- Query 14: Artists with more than 2 artworks
SELECT a.Name
FROM Virtual.Artists a
JOIN Virtual.Artworks w ON a.ArtistID = w.ArtistID
GROUP BY a.Name
HAVING COUNT(w.ArtworkID) > 2;
--OR
SELECT a.Name
FROM Virtual.Artists a, Virtual.Artworks w WHERE a.ArtistID = w.ArtistID
GROUP BY a.Name
HAVING COUNT(w.ArtworkID) > 2;
GO
-- Query 15: Average year of artworks by category
SELECT c.Name AS Category, AVG(w.Year) AS AvgYear
FROM Virtual.Categories c
JOIN Virtual.Artworks w ON c.CategoryID = w.CategoryID
GROUP BY c.Name
HAVING COUNT(w.ArtworkID) > 1;
--OR
SELECT c.Name AS Category, AVG(w.Year) AS AvgYear
FROM Virtual.Categories c, Virtual.Artworks w 
WHERE c.CategoryID = w.CategoryID
GROUP BY c.Name
HAVING COUNT(w.ArtworkID) > 1;
GO
-- Query 16: Artworks exhibited in 'Modern Art Masterpieces'
SELECT w.Title
FROM Virtual.Artworks w
JOIN Virtual.ExhibitionArtworks ea ON w.ArtworkID = ea.ArtworkID
JOIN Virtual.Exhibitions e ON ea.ExhibitionID = e.ExhibitionID
WHERE e.Title = 'Modern Art Masterpieces';
--OR
SELECT w.Title
FROM Virtual.Artworks w, Virtual.ExhibitionArtworks ea, Virtual.Exhibitions e 
WHERE w.ArtworkID = ea.ArtworkID AND ea.ExhibitionID = e.ExhibitionID AND e.Title = 'Modern Art Masterpieces';
GO
-- Query 17: Categories where the average year of artworks is greater than the average year of all artworks
SELECT c.Name AS Category
FROM Virtual.Categories c
JOIN Virtual.Artworks w ON c.CategoryID = w.CategoryID
GROUP BY c.Name
HAVING AVG(w.Year) > (SELECT AVG(Year) FROM Virtual.Artworks);
-- OR
SELECT c.Name AS Category
FROM Virtual.Categories c, Virtual.Artworks w WHERE c.CategoryID = w.CategoryID
GROUP BY c.Name
HAVING AVG(w.Year) > (SELECT AVG(Year) FROM Virtual.Artworks);
GO
-- Query 18: Artworks not exhibited in any exhibition
SELECT w.Title
FROM Virtual.Artworks w
LEFT JOIN Virtual.ExhibitionArtworks ea ON w.ArtworkID = ea.ArtworkID
WHERE ea.ExhibitionID IS NULL;
GO
-- Query 19: Artists who have artworks in the same category as 'Mona Lisa'
SELECT DISTINCT a.Name
FROM Virtual.Artists a
JOIN Virtual.Artworks w ON a.ArtistID = w.ArtistID
JOIN Virtual.Categories c ON w.CategoryID = c.CategoryID
WHERE c.CategoryID = (SELECT CategoryID FROM Virtual.Artworks WHERE Title = 'Mona Lisa');
-- OR
SELECT DISTINCT a.Name
FROM Virtual.Artists a, Virtual.Artworks w, Virtual.Categories c 
WHERE a.ArtistID = w.ArtistID AND w.CategoryID = c.CategoryID
AND c.CategoryID = (SELECT CategoryID FROM Virtual.Artworks WHERE Title = 'Mona Lisa');
GO
-- Query 20: List the names of artists and the number of artworks they have in the gallery
SELECT a.Name, COUNT(w.ArtworkID) AS ArtworkCount
FROM Virtual.Artists a
LEFT JOIN Virtual.Artworks w ON a.ArtistID = w.ArtistID
GROUP BY a.Name;
GO

