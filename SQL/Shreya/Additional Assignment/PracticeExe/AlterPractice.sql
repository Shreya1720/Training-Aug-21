--Write a SQL statement to add a column region_id to the table locations.

ALTER TABLE Locations
ADD  region_id INT

--Write a SQL statement to add a columns ID of the table locations.

ALTER TABLE Locations 
ADD  ID INT

--Write a SQL statement to add a column region_id after state_province to the table locations.

ALTER TABLE Locations
ADD  region_id INT 
AFTER StateProvince;

--Write a SQL statement change the data type of the column country_id to integer in the table locations.
ALTER TABLE Locations 
ALTER COLUMN CountryId INT

--Write a SQL statement to drop the column city from the table locations.
ALTER TABLE Locations 
DROP COLUMN  City

--Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.

EXEC sp_rename 'Locations.StateProvince' , 'State','COLUMN';

--8. Write a SQL statement to add a primary key for the columns location_id in the locations table.

ALTER TABLE Locations
ADD CONSTRAINT Location_LocationID_Pk PRIMARY KEY (LocationID)

--9. Write a SQL statement to add a primary key fo r a combination of columns location_id and country_id.

ALTER TABLE Locations
ADD CONSTRAINT Location_LocationCountryID_Pk PRIMARY KEY (LocationID,CountryID)

--Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.

ALTER TABLE Locations 
DROP CONSTRAINT Location_LocationCountryID_Pk 

--11. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.

ALTER TABLE Job_History 
ADD CONSTRAINT JobHistory_JobID_FK FOREIGN KEY (Job_Id) REFERENCES  jobs(job_id)

/*12. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing 
to the primary key job_id of jobs table.*/

ALTER TABLE Job_History 
ADD CONSTRAINT fk_job_id FOREIGN KEY (Job_Id) REFERENCES  jobs(job_id)

/*13. Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is
referencing to the job_id of jobs table.*/
ALTER TABLE Job_History
DROP CONSTRAINT fk_job_id

--14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
--error
ALTER TABLE Job_History
ADD INDEX indx_job_id(Job_Id)

--15. Write a SQL statement to drop the index indx_job_id from job_history table.
ALTER TABLE Job_History 
DROP CONSTRAINT indx_job_id
