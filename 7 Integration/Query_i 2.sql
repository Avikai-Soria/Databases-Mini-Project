Select Department_ID, count(room_id)
From Department Natural Join AHELLER.ROOMS
Group By Department_ID
Order By count(room_id) DESC
