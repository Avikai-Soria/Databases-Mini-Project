Select Room_ID
From Exhibit Natural Join ExhibitAtExhibition Natural Join ExhibitionAtDepartment Natural Join Department Natural Join AHELLER.ROOMS
Group By Room_ID
Having Sum(Price) > 10000
Order By sum(price) DESC
