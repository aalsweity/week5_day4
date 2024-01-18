CREATE OR REPLACE PROCEDURE insert_data(
	title varchar, 
	description TEXT, 
	release_year public."year", 
	language_id int2, 
	rental_duration int2, 
	rental_rate numeric(4,2), 
	length int2, 
	replacement_cost numeric(5,2),
	rating public.mpaa_rating
	)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
	
END
$$;

CALL insert_data(CAST('The Gooonies' AS varchar),CAST('best movie ever!' AS TEXT), YEAR(1985), CAST(1 AS int2), CAST(7 AS int2), CAST(4.99 AS NUMERIC(4,2)), CAST(117 AS int2), CAST(14.99 AS NUMERIC(5,2)), CAST('PG' AS public.mpaa_rating) );

SELECT *
FROM film
WHERE title = 'The Gooonies';

CREATE OR REPLACE FUNCTION get_category_count(num int2)
RETURNS integer
LANGUAGE plpgsql --main syntax error
AS $$
	DECLARE cat_num integer;
BEGIN 
	SELECT count(*) INTO cat_num -- error was tring TO pass 2 SELECT statements INTO cat_num.
	FROM film_category
	WHERE category_id = num;
	RETURN cat_num;
END;
$$; --code is now resolved of issues.                     

select get_category_count(CAST(16 AS int2));

	 
	

