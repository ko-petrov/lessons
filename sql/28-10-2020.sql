--??????? 8.24
SELECT ?????.??_???, ?????.????????, ?????.????????????, ????????????.????????????
	FROM ?????  inner JOIN ????????????
				ON ?????.???????????? = ????????????.??_???
	order by ?????.????????
--??????? 8.25
SELECT ??????.???????, ??????.???, ??????.?????, ??????.??????
	FROM ?????? INNER JOIN ????????????
		ON ??????.?????= ????????????.?????
--??????? 8.26
SELECT ????????????.??_???, ?????.????????, ????????????.??????, ????????????.??????
	FROM ????? INNER JOIN ????????????
		ON ?????.???????????? = ????????????.??_???
	WHERE (????????????.?????? = '??????') OR (????????????.?????? <> '??????' AND ????????????.?????? <> '?????????' AND ????????????.?????? <> '??????????')
--??????? 8.27
SELECT ??????.??????? + ' ' + ??????.??? AS "?????", count(?????.????????) AS "?????????? ????"
	FROM ?????? INNER JOIN [?????-??????]
		ON ??????.??_??? = [?????-??????].??_???
		inner Join ????? ON ?????.??_??? = [?????-??????].??_???
	group by ??????.??????? + ' ' + ??????.???
--??????? 8.28
SELECT ?????.????????, sum(????????.?????) AS "?????"
	FROM ????? INNER JOIN ????????
		on ?????.??_??? = ????????.??_???
	where ?????.???? = '??????????' AND ????????.????? IS NOT NULL
	group by ?????.????????
--??????? 8.29
SELECT ?????.????, COUNT(*) "???-?? ????", SUM(????????.?????) "????? ???????"
	FROM ????? INNER JOIN ????????
		on ?????.??_??? = ????????.??_???
	group by ?????.????
--??????? 8.41
SELECT ??????.??_???, count([?????-??????].??_???)
	FROM ?????? LEFT JOIN [?????-??????]
		on ??????.??_??? = [?????-??????].??_???
	Group by ??????.??_???
--??????? 8.42
SELECT ??????.??_???, ??????.???, ??????.???????
	FROM ?????? LEFT JOIN [?????-??????]
		on ??????.??_??? = [?????-??????].??_???
	where [?????-??????].??_??? IS NULL
--??????? 8.44
SELECT DISTINCT ??????.???????, ??????.???, ??????.????? "????? ??????", ????????????.????? "????? ????????????", ????????????.????????????
	FROM ?????? LEFT JOIN [?????-??????]
		on ??????.??_??? = [?????-??????].??_???
		LEFT JOIN ????? on [?????-??????].??_??? = ?????.??_???
		LEFT JOIN ???????????? on ????????????.??_??? = ?????.????????????
	where ??????.????? = ????????????.?????
