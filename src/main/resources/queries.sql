
-- Antalet böcker utlånade respektive ej utlånade på de olika biblioteken.
SELECT
  bc.library_id,
  SUM(bc.quantity)                           AS total_copies,
  COALESCE(SUM(lb.loaned_count), 0)          AS on_loan,
  GREATEST(SUM(bc.quantity) - COALESCE(SUM(lb.loaned_count), 0), 0) AS available
FROM Book_copy bc
LEFT JOIN (
    -- hur många exemplar av varje book_copy_id som för närvarande är utlånade
    SELECT lbc.book_copy_id, COUNT(*) AS loaned_count
    FROM Loan_Book_copy lbc
    JOIN Loan l ON l.loan_id = lbc.loan_id
    WHERE l.status != 'returned'   -- räknar endast aktiva/ej återlämnade lån
    GROUP BY lbc.book_copy_id
) lb ON lb.book_copy_id = bc.book_copy_id
GROUP BY bc.library_id
ORDER BY bc.library_id;

-- Antalet böcker utlånade för alla bibliotek.
SELECT
  bc.library_id,
  COALESCE(SUM(lb.loaned_count), 0) AS on_loan
FROM Book_copy bc
LEFT JOIN (
    -- hur många exemplar av varje book_copy_id som för närvarande är utlånade
    SELECT lbc.book_copy_id, COUNT(*) AS loaned_count
    FROM Loan_Book_copy lbc
    JOIN Loan l ON l.loan_id = lbc.loan_id
    WHERE l.status != 'returned'   -- räknar endast aktiva/ej återlämnade lån
    GROUP BY lbc.book_copy_id
) lb ON lb.book_copy_id = bc.book_copy_id
GROUP BY bc.library_id
ORDER BY bc.library_id;

-- Antalet böcker ej utlånade för alla bibliotek.
SELECT
  bc.library_id,
  SUM(bc.quantity) - COALESCE(SUM(lb.loaned_count), 0) AS available
FROM Book_copy bc
LEFT JOIN (
    -- hur många exemplar av varje book_copy_id som för närvarande är utlånade
    SELECT lbc.book_copy_id, COUNT(*) AS loaned_count
    FROM Loan_Book_copy lbc
    JOIN Loan l ON l.loan_id = lbc.loan_id
    WHERE l.status != 'returned'   -- räknar endast aktiva/ej återlämnade lån
    GROUP BY lbc.book_copy_id
) lb ON lb.book_copy_id = bc.book_copy_id
GROUP BY bc.library_id
ORDER BY bc.library_id;

-- Top 10 lista på populär böcker per bibliotek (här med id = 1).
SELECT lbc.book_copy_id, COUNT(*) AS loaned_count
FROM Loan_Book_copy lbc
JOIN Loan l ON l.loan_id = lbc.loan_id
JOIN Book_copy bc ON bc.book_copy_id = lbc.book_copy_id WHERE bc.library_id = 1
GROUP BY lbc.book_copy_id
ORDER BY loaned_count DESC
LIMIT 10;

-- Top 10 lista på populär böcker för alla bibliotek.
SELECT bc.library_id, lbc.book_copy_id, COUNT(*) AS loaned_count
FROM Loan_Book_copy lbc
JOIN Loan l ON l.loan_id = lbc.loan_id
JOIN Book_copy bc ON bc.book_copy_id = lbc.book_copy_id
GROUP BY bc.library_id, lbc.book_copy_id
ORDER BY bc.library_id, loaned_count DESC
LIMIT 10;

-- Se hur många medborgare som lånat en eller flera böcker.
SELECT COUNT(DISTINCT m.member_id) AS "Active members"
FROM Member m, Member_Loan ml WHERE ml.member_id = m.member_id;

-- Se hur många böcker som aldrig blivit utlånade.
SELECT COUNT(*) AS "books never loaned"
FROM Book b
LEFT JOIN Book_copy bc ON b.book_id = bc.book_id
LEFT JOIN Loan_Book_copy lbc ON bc.book_copy_id = lbc.book_copy_id
WHERE lbc.book_copy_id IS NULL;

-- Se antalet böcker per kategori för alla bibliotek.


-- Se antalet böcker per kategori för varje bibliotek.



