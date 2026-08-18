CREATE OR REPLACE TABLE fact_sales AS

SELECT
    i.InvoiceId,
    il.InvoiceLineId,
    CAST(i.InvoiceDate AS DATE) AS InvoiceDate,

    i.CustomerId,

    il.TrackId,

    t.GenreId,

    al.ArtistId,

    i.BillingCountry,

    il.Quantity,

    il.UnitPrice,

    il.Quantity * il.UnitPrice AS Revenue

FROM chinook.InvoiceLine il

JOIN chinook.Invoice i
    ON il.InvoiceId = i.InvoiceId

JOIN chinook.Track t
    ON il.TrackId = t.TrackId

JOIN chinook.Album al
    ON t.AlbumId = al.AlbumId;
