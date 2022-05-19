CREATE TABLE Area
(
  AreaID INT NOT NULL,
  AreaName INT NOT NULL,
  PRIMARY KEY (AreaID)
);

CREATE TABLE City
(
  CityName INT NOT NULL,
  AreaID INT NOT NULL,
  PRIMARY KEY (CityName),
  FOREIGN KEY (AreaID) REFERENCES Area(AreaID)
);

CREATE TABLE Agent
(
  AgentID INT NOT NULL,
  AgentName INT NOT NULL,
  Rating INT NOT NULL,
  HireYear INT NOT NULL,
  BossID INT NOT NULL,
  Salary INT NOT NULL,
  AreaID INT NOT NULL,
  PRIMARY KEY (AgentID),
  FOREIGN KEY (AreaID) REFERENCES Area(AreaID)
);

CREATE TABLE Client
(
  ClientID INT NOT NULL,
  ClientName INT NOT NULL,
  PhoneNr INT NOT NULL,
  Address INT NOT NULL,
  AgentID INT NOT NULL,
  PRIMARY KEY (ClientID),
  FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
);

CREATE TABLE Schedule
(
  AgentID INT NOT NULL,
  ClientID INT NOT NULL,
  MeetingTime INT NOT NULL,
  ClientID INT NOT NULL,
  AgentID INT NOT NULL,
  PRIMARY KEY (AgentID, ClientID, AgentID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
  FOREIGN KEY (AgentID) REFERENCES Agent(AgentID),
  UNIQUE (ClientID),
  UNIQUE (MeetingTime)
);

