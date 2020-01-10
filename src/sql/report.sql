SELECT s.name,s.surname,c.class FROM student s INNER JOIN class c ON s.classID=c.classID WHERE c.classID = 2;

SELECT s.name,s.surname,c.class FROM student s INNER JOIN class c ON s.classID=c.classID WHERE c.class LIKE ('1b');

SELECT c.class FROM teacher t INNER JOIN teacherclass tc ON t.teacherID = tc.teacherID 
INNER JOIN class c ON c.classID=tc.classID WHERE name LIKE ('John') AND surname LIKE ('Doe');