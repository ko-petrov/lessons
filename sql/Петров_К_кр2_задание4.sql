/*������� 6. ������� 4. ���� ����*/
SELECT DISTINCT ���.���_����
	FROM ��� 
EXCEPT
SELECT DISTINCT ���.���_����
	FROM ��� inner JOIN ����� ON ���.���_���� = �����.���_����
			 inner JOIN ����� ON �����.���_������ = �����.���_������
	WHERE ���� = '�������'