/*Вариант 6. Задание 4. база кино*/
SELECT DISTINCT Зал.Код_зала
	FROM Зал 
EXCEPT
SELECT DISTINCT Зал.Код_зала
	FROM Зал inner JOIN Показ ON Зал.Код_зала = Показ.Код_зала
			 inner JOIN Фильм ON Показ.Код_фильма = Фильм.Код_фильма
	WHERE Жанр = 'комедия'