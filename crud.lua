local luasql = require "luasql.sqlite3"
local env = luasql.sqlite3()
local con = env:connect('crudlearn.db')

--Create (Insert)
con:execute [[
  INSERT INTO employee VALUES (1, 'John Doe', 'johndoe@example.com', 'Engineer');
]]
print("Record created successfully")


--Retrieve (Select)
local cur = con:execute [[
  SELECT * FROM employee;
]]

local row = cur:fetch({}, "a")
while row do
  print(string.format("ID: %s, Name: %s, Email: %s, Designation: %s", row.id, row.name, row.email, row.designation))
  row = cur:fetch(row, "a")
end
print("Records retrieved successfully")

--Update 
con:execute [[
  UPDATE employee SET name = 'Jane Doe', email = 'janedoe@example.com' WHERE id = 1;
]]
print("Record updated successfully")

--Delete
con:execute [[
  DELETE FROM employee WHERE id = 1;
]]
print("Record deleted successfully")


cur:close()
con:close()
env:close()