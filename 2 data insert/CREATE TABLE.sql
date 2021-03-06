CREATE TABLE Exhibition
(
  ExhibitionId INT NOT NULL,
  URL  VARCHAR(50) NOT NULL,
  Genre VARCHAR(20) NOT NULL,
  StartTime DATE NOT NULL,
  EndTime DATE NOT NULL,
  PRIMARY KEY (ExhibitionId)
);


CREATE TABLE Exhibit
(
  ExhibitId INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Price FLOAT NOT NULL,
  DatePurchased DATE NOT NULL,
  PRIMARY KEY (ExhibitId)
);

CREATE TABLE Curator
(
  CuratorId INT NOT NULL,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  Email VARCHAR(40) NOT NULL,
  Rank INT NOT NULL,
  Date_of_birth DATE NOT NULL,
  
  PRIMARY KEY (CuratorId)
);

CREATE TABLE ExhibitHistory
(
  ExhibitHistoryId INT NOT NULL,
  ExhibitId INT NOT NULL,
  Status VARCHAR(40) NOT NULL,
  DateIncome DATE NOT NULL,
  PRIMARY KEY (ExhibitHistoryId),
  FOREIGN KEY (ExhibitId) REFERENCES Exhibit(ExhibitId)
);

CREATE TABLE ExhibitionAtDepartment 
(
  ExhibitionAtDepartmentId INT NOT NULL,
  DepartmentId INT NOT NULL,
  ExhibitionId INT NOT NULL,
  PRIMARY KEY (ExhibitionAtDepartmentId),
  FOREIGN KEY (DepartmentId) REFERENCES ZAGURI.DEPARTMENT (DepartmentId),
  FOREIGN KEY (ExhibitionId) REFERENCES Exhibition(ExhibitionId)
);

CREATE TABLE ExhibitAtExhibition
(
  ExhibitAtExhibitionId INT NOT NULL,
  ExhibitId INT NOT NULL,
  ExhibitionId INT NOT NULL,
  PRIMARY KEY (ExhibitAtExhibitionId),
  FOREIGN KEY (ExhibitId) REFERENCES Exhibit(ExhibitId),
  FOREIGN KEY (ExhibitionId) REFERENCES Exhibition(ExhibitionId)
);

CREATE TABLE CuratorAtExhibition
(
  CuratorAtExhibitionId  INT NOT NULL,
  SalaryForCurator INT NOT NULL,
  CuratorId INT NOT NULL,
  ExhibitionId INT NOT NULL,
  PRIMARY KEY (CuratorAtExhibitionId),
  FOREIGN KEY (CuratorId) REFERENCES Curator(CuratorId),
  FOREIGN KEY (ExhibitionId) REFERENCES Exhibition(ExhibitionId)
);

CREATE TABLE Department
(
  Department_Id INT NOT NULL,
  Contributor VARCHAR(20) NOT NULL,
  Floor INT NOT NULL,
  
  PRIMARY KEY (Department_Id)
);
