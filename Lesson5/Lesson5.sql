
  3) a) 
  --������� ������ � ������� Production.UnitMeasure. 
SELECT *
FROM Production.UnitMeasure

--���������, ���� �� ����� UnitMeasureCode, ������������ �� ����� �Ғ.
SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'

--������� ����� ��������� ����� ����� ����? 
SELECT COUNT(UnitMeasureCode) AS COUNTUnitMeasureCode
FROM Production.UnitMeasure

/*�������� ��������� ����� ������ � �������:
TT1, Test 1, 9 �������� 2020
TT2, Test 2, getdate()*/

INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT1', 'Test 1', CAST('2020/09/09' AS DATE)),
       ('TT2', 'Test 2', getdate())

b) --������ ��������� ����������� ����� � �����, �� ������������ ������� Production.UnitMeasureTest. 
 
SELECT UnitMeasureCode, Name, ModifiedDate
INTO [Production].[UnitMeasureTest]
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'

--��������� ���� ���������� �� Production.UnitMeasure �� UnitMeasureCode = �CAN�.

INSERT INTO [Production].[UnitMeasureTest] (UnitMeasureCode, Name, ModifiedDate)
SELECT  *
FROM Production.UnitMeasure
WHERE UnitMeasureCode = 'CAN'

--���������� ��������� � ��������������� ���� �� ����. 

SELECT *
FROM [Production].[UnitMeasureTest]
ORDER BY UnitMeasureCode

c) --�������� UnitMeasureCode ��� ����� ������ �� Production.UnitMeasureTest �� �TTT�.

UPDATE [Production].[UnitMeasureTest]
SET UnitMeasureCode = 'TTT'

d) --������� ��� ������ �� Production.UnitMeasureTest.

DELETE
FROM [Production].[UnitMeasureTest]

4. -- ������� �������� count(1), count(name), count(id), count(*) ��� ��������� �������:
/*Id(PK)	Name		DepName
  1	        null		A
  2	        null		null
  3	        A  		    C
  4	        B		    C*/

 Id(PK)	    Name		DepName   count(1)     count(name)   count(id)   count(*)
  1	        null		A            1          null           1            1
  2	        null		null         1          null           1            1
  3	        A  		    C            1           1             1            1
  4	        B		    C            1           1             1            1
  