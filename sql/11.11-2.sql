/*SELECT *
	FROM DailyData t1 JOIN DailyData t2 on t1.День = t2.День
	where t1.*/

Select DailyData.День, DailyData.Т_сред
	from DailyData
	where DailyData.Год = '2000' and DailyData.Месяц = '5' and DailyData.Станция = '23418'