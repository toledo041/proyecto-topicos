

use Vinculation
CREATE PROCEDURE dbo.obtenerSectores
AS
BEGIN
    SELECT idSector, sectorname FROM Sector;
END;

exec dbo.obtenerSectores


CREATE PROCEDURE dbo.sp_getEmpreneur
AS
BEGIN
    SELECT idEmpreneur,request,objetive,codeOfEmpreneur,workteam,startdate,finaldate,duration,Empreneur.idEmployee, 
CONCAT(Employee.name,' ',Employee.lastname,' ',Employee.[mother'sLastName]) employeeName,Empreneur.idStudent,
CONCAT(Student.name, ' ',Student.lastName,' ',Student.mothersthestName) studentName
     
  FROM Empreneur
  INNER JOIN Employee ON Employee.idEmployee = Empreneur.idEmployee
  INNER JOIN Student ON Student.idStudent = Empreneur.idStudent
  where Empreneur.status = 1;
END;

CREATE PROCEDURE dbo.sp_getEmployees
AS
BEGIN
    SELECT idEmployee, 
	CONCAT(Employee.name,' ',Employee.lastname,' ',Employee.[mother'sLastName]) employeeName    
  FROM Employee
  where status = 1; 
END;

CREATE PROCEDURE dbo.sp_getComplementaryActivity
AS
BEGIN
  SELECT idComplementaryActivity,
      ComplementaryActivity.activityname,      
      ComplementaryActivity.idStudent,
	  CONCAT(Student.name, ' ',Student.lastName,' ',Student.mothersthestName) studentName,
      ComplementaryActivity.idActivityType,
	  ActivityType.activityname
      
  FROM ComplementaryActivity
  INNER JOIN Student ON Student.idStudent = ComplementaryActivity.idStudent
  INNER JOIN ActivityType ON ActivityType.idActivityType = ComplementaryActivity.idActivityType
  where ComplementaryActivity.status = 1;
END;

exec dbo.sp_getEmpreneur

exec dbo.sp_getEmployees

CREATE PROCEDURE dbo.sp_getComplementaryActivity
AS
BEGIN
  SELECT idComplementaryActivity,
      ComplementaryActivity.activityname,      
      ComplementaryActivity.idStudent,
	  CONCAT(Student.name, ' ',Student.lastName,' ',Student.mothersthestName) studentName,
      ComplementaryActivity.idActivityType,
	  ActivityType.activityname
      
  FROM ComplementaryActivity
  INNER JOIN Student ON Student.idStudent = ComplementaryActivity.idStudent
  INNER JOIN ActivityType ON ActivityType.idActivityType = ComplementaryActivity.idActivityType
  where ComplementaryActivity.status = 1;
END;

CREATE PROCEDURE dbo.sp_getActivityType
AS
BEGIN
  SELECT 
	  idActivityType,
	  activityname
      
  FROM ActivityType 
  where status = 1;
END;

CREATE PROCEDURE dbo.sp_getComplementaryActivityCompany
AS
BEGIN
  SELECT idComplementaryActivityCompany
      ,ComplementaryActivityCompany.idComplementaryActivity
	  ,ComplementaryActivity.activityname
      ,ComplementaryActivityCompany.IdCompany
	  ,Company.name AS companyName
      
  FROM ComplementaryActivityCompany
  INNER JOIN ComplementaryActivity on ComplementaryActivity.idComplementaryActivity = ComplementaryActivityCompany.idComplementaryActivity
  INNER JOIN Company ON Company.idCompany = ComplementaryActivityCompany.IdCompany
  where ComplementaryActivityCompany.status = 1;
End;

exec dbo.sp_getComplementaryActivityCompany 

exec dbo.sp_getComplementaryActivity
exec dbo.sp_getActivityType

