/*������� 6 ���� ����������-19*/
/*������� 1*/
SELECT ��������.���, COUNT(*) "���-�� ����"
	FROM ��������  inner JOIN �����������
				ON ��������.������ = �����������.������
	where ��������.����������� >= 1970
	group by ��������.���
/*������� 2*/
SELECT ��������.������ "��������", ��������.���, ��������.�������, COUNT(DISTINCT �����������.������) "���-�� ����"
	FROM ��������  inner JOIN �����������
				ON ��������.������ = �����������.������
					inner Join ���������
				ON �����������.������ = ���������.��������
					inner JOIN �������
				ON ���������.���� = �������.����
	
	WHERE �������.���� = '��������' AND ��������.������������ = '����'
	GROUP BY ��������.������, ��������.���, ��������.�������
/*������� 3*/
SELECT DISTINCT ��������.������, ��������.�������, ��������.������������
	FROM �������� inner JOIN �����������
			ON �����������.�������������� = ��������.�����������
				  left JOIN �����������
				ON ��������.������ = �����������.������
	WHERE (�����������.����������� LIKE '%�������%') and (�����������.���������� is NULL)