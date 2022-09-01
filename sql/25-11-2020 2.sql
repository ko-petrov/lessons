/*9.34*/
SELECT *
FROM книги
where (жанр <> 'фантастика') AND (цена < ALL (SELECT цена
											 FROM книги
										     where (жанр = 'фантастика') AND цена IS NOT NULL ))
/*9.35*/
SELECT *
FROM книги
where продажи  > ALL (SELECT продажи
				      FROM книги 
				      where ид_кни = (SELECT ид_кни FROM [книги-авторы] WHERE [книги-авторы].ид_авт = 'А05') ) 
/*9.36*/

SELECT Жанр, AVG(продажи) "Средние продажи"
FROM книги
GROUP BY жанр
/*9.38*/
SELECT *
FROM книги
where (жанр <> 'фантастика') AND (цена < ANY (SELECT цена
											 FROM книги
										     where (жанр = 'фантастика')  )) 
