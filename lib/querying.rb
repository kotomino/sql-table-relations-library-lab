def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL
    SELECT title, year
    FROM Books
    WHERE series_id = 1
    ORDER BY year
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  <<-SQL
    SELECT name, motto
    FROM Characters
    ORDER BY LENGTH(motto) DESC LIMIT 1;
  SQL
end


def select_value_and_count_of_most_prolific_species
  <<-SQL
    SELECT species, COUNT(species)
    FROM Characters
    GROUP BY species 
    ORDER BY COUNT(species) DESC LIMIT 1;
  SQL
end

def select_name_and_series_subgenres_of_authors
  <<-SQL
    SELECT Authors.name, Subgenres.name
    FROM Authors
    JOIN Series
    ON Authors.id = Series.author_id
    JOIN Subgenres
    ON Subgenres.id = Series.subgenre_id
  SQL
end

def select_series_title_with_most_human_characters
  <<-SQL
    SELECT Series.title
    FROM Series
    JOIN Books
    ON Series.id = Books.series_id
    JOIN Character_books
    ON Books.id = Character_books.book_id
    JOIN Characters
    ON Characters.id = Character_books.character_id
    WHERE Characters.species = "human"
    GROUP BY Series.title
    ORDER BY COUNT(Characters.species) DESC LIMIT 1;

  SQL
end

def select_character_names_and_number_of_books_they_are_in
  <<-SQL
    SELECT Characters.name, COUNT(*)
    FROM Characters
    JOIN Character_books
    ON Characters.id = Character_books.character_id
    GROUP BY Characters.name
    ORDER BY COUNT(*) DESC, Characters.name;
  SQL

end
