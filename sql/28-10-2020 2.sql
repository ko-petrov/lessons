--??????? 1
SELECT DISTINCT ??????.???????, ??????.???
	FROM ?????? LEFT JOIN [?????-??????]
		on ??????.??_??? = [?????-??????].??_???
		LEFT JOIN ????? on [?????-??????].??_??? = ?????.??_???
		LEFT JOIN ???????????? on ????????????.??_??? = ?????.????????????
	where ?????.???? = '???????' OR ?????.???? = '??????????'
--??????? 2
SELECT ??????.??_???, ??????.???, ??????.???????
	FROM ?????? LEFT JOIN [?????-??????]
		on ??????.??_??? = [?????-??????].??_???
	where [?????-??????].??_??? IS NULL
--??????? 3
SELECT ???????, ???
	from ??????
EXCEPT
SELECT DISTINCT ??????.???????, ??????.???
	FROM ?????? LEFT JOIN [?????-??????]
		on ??????.??_??? = [?????-??????].??_???
		LEFT JOIN ????? on [?????-??????].??_??? = ?????.??_???
		LEFT JOIN ???????????? on ????????????.??_??? = ?????.????????????
	where ?????.???? = '???????' OR ?????.???? = '??????????'
--??????? 4
SELECT ???????, ???
	from ??????
EXCEPT
SELECT DISTINCT ??????.???????, ??????.???
	FROM ?????? LEFT JOIN [?????-??????]
		on ??????.??_??? = [?????-??????].??_???
		LEFT JOIN ????? on [?????-??????].??_??? = ?????.??_???
		LEFT JOIN ???????????? on ????????????.??_??? = ?????.????????????
	where ????????????.????? = '??????' OR ????????????.?????? = '?????????? ???????'