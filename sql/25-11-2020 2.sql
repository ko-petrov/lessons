/*9.34*/
SELECT *
FROM �����
where (���� <> '����������') AND (���� < ALL (SELECT ����
											 FROM �����
										     where (���� = '����������') AND ���� IS NOT NULL ))
/*9.35*/
SELECT *
FROM �����
where �������  > ALL (SELECT �������
				      FROM ����� 
				      where ��_��� = (SELECT ��_��� FROM [�����-������] WHERE [�����-������].��_��� = '�05') ) 
/*9.36*/

SELECT ����, AVG(�������) "������� �������"
FROM �����
GROUP BY ����
/*9.38*/
SELECT *
FROM �����
where (���� <> '����������') AND (���� < ANY (SELECT ����
											 FROM �����
										     where (���� = '����������')  )) 
