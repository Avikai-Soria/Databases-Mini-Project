CREATE TABLE Exhibition
(
  Name VARCHAR(20) NOT NULL,
  ExhibitionId INT NOT NULL,
  Genre VARCHAR(20) NOT NULL,
  StartTime DATE NOT NULL,
  EndTime DATE NOT NULL,
  PRIMARY KEY (ExhibitionId)
);


CREATE TABLE Exhibit
(
  ExhibitId INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
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
  PRIMARY KEY (CuratorId)
);

CREATE TABLE ExhibitHistory
(
  ExhibitHistoryId INT NOT NULL,
  ExhibitId INT NOT NULL,
  Status VARCHAR(20) NOT NULL,
  Date DATE NOT NULL,
  PRIMARY KEY (ExhibitHistoryId)
);

CREATE TABLE ExhibitionAtDeparment
(
  DepartmentId INT NOT NULL,
  ExhibitionId INT NOT NULL,
  PRIMARY KEY (DepartmentId, ExhibitionId),
  FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId),
  FOREIGN KEY (ExhibitionId) REFERENCES Exhibition(ExhibitionId)
);

CREATE TABLE ExhibitAtExhibition
(
  ExhibitId INT NOT NULL,
  ExhibitionId INT NOT NULL,
  PRIMARY KEY (ExhibitId, ExhibitionId),
  FOREIGN KEY (ExhibitId) REFERENCES Exhibit(ExhibitId),
  FOREIGN KEY (ExhibitionId) REFERENCES Exhibition(ExhibitionId)
);

CREATE TABLE CuratorAtExhibition
(
  SalaryForCurator FLOAT NOT NULL,
  CuratorId INT NOT NULL,
  ExhibitionId INT NOT NULL,
  PRIMARY KEY (CuratorId, ExhibitionId),
  FOREIGN KEY (CuratorId) REFERENCES Curator(CuratorId),
  FOREIGN KEY (ExhibitionId) REFERENCES Exhibition(ExhibitionId)
);
