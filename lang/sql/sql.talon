mode: user.sql
mode: user.auto_lang
and code.language: sql
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_block_comment

select: "SELECT "
from: "FROM "
select star from: "SELECT *\nFROM "
where: "WHERE "
order by: "ORDER BY "
group by: "GROUP BY "
descending: " DESC"
ascending: " ASC"
dot i d: ".id"
is not null: " IS NOT NULL"
is null: " IS NULL"
inner join:
    insert("INNER JOIN  ON ")
    key(left:4)
left outer join:
    insert("LEFT OUTER JOIN  ON ")
    key(left:4)
right outer join:
    insert("RIGHT OUTER JOIN  ON ")
    key(left:4)
    
column:
    key(return)
    ", "

count:
    "Count()"
    key(left)

date:
    "DATE ''"
    key(left)

funk <user.code_functions>:
    user.code_insert_function(code_functions, "")

funk wrap <user.code_functions>:
    user.code_insert_function(code_functions, edit.selected_text())
