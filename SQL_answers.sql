-- Question #1
-- Based on the ERD provided, write a SQL query to find the number of occurrences that an ingredient named “Lobster Ravioli” was sold at each store. Rank the stores by dishes sold with the highest occurrence first.
    
    --Assume store name was not asked for, otherwise would do join with store_id
    SELECT store_id, COUNT(sale_id)
    FROM 
    Ingredient 
    INNER JOIN sales ON  ingredient.ingredient_id = sales.ingredient_id
    WHERE
    Ingredient.ingredient_name = “Lobster Ravioli”
    GROUP BY sale_id
    ORDER BY COUNT(sale_id)

-- Question #2
-- Revise the query from Question #1 to limit the dataset queried between April 1st, 2021 to May 1st, 2021. Return only the stores that have sold more than 45 Lobster Ravioli dishes.
    
    --Assuming business_date is inclusive for April 1st, 2021 to May 1st, 2021
    SELECT store_id, COUNT(sale_id)
    FROM 
    Ingredient 
    INNER JOIN sales ON  ingredient.ingredient_id = sales.ingredient_id
    WHERE
    Ingredient.ingredient_name = “Lobster Ravioli”
    AND 
    business _date >= “2021-04-01” 
    AND 
    Business_date <= “2021-05-01”
    GROUP BY sale_id
    HAVING COUNT(sale_id) > 45
    ORDER BY COUNT(sale_id)


-- Question #3
-- Referencing the Sales table, write the corresponding `CREATE` SQL DDL statement. Include and provide justification for any improvements or add-ons as you see fit.
    
    --Updated sale_id to id, redundant to call it sales_id while it is in the Sales table
    CREATE TABLE Sales (
    id int NOT NULL,
    store_id int NOT NULL,
    business_date date,
    ingredient_id int NOT NULL,
    sold_price float,
    PRIMARY KEY(sale_id),
    FOREIGN KEY(store_id) REFERENCES Store(store_id),
    FOREIGN KEY(ingredient_id) REFERENCES Ingredient(ingredient_id)
    )
