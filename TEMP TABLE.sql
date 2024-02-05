
-- TEMP Table Example

CREATE TABLE #Employee		-- This will be created in TempDB
(
ID		INT NOT NULL,
NAME	VARCHAR(40) 
)

INSERT INTO #Employee		-- Scope of this table will only be within this session
VALUES (1, 'Divya'),
(2, 'Sneha'),
(3, 'Arjun')

SELECT	* 
FROM	#Employee			-- Note: Temp table can be created to load the subset of data from the permanent table to do all calculation on the smaller dataset. 
							-- After performing all the calculations, the records can be inserted or updated into permanant tables
							


		-- DELETED AUTOMATICALLY AFTER THE SSMS IS CLOSED 