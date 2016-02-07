CREATE TABLE students ( c XML );
INSERT INTO students VALUES ('
<students>
  <student>
    <matnr>123456</matnr>
    <firstname>Susi</firstname>
    <lastname>Sinnlos</lastname>
    <laptops>
      <laptop lid="222">OLIVETTI A5</laptop>
      <laptop lid="333">MacBook</laptop>
    </laptops>
  </student>
  <student>
    <matnr>123457</matnr>
    <firstname>Rudi</firstname>
    <lastname>Ratlos</lastname>
    <laptops>
      <laptop lid="444">Osborne 1</laptop>
    </laptops>
  </student>
  <student>
    <matnr>123458</matnr>
    <vorname>Willi</vorname>
    <nachname>Wahnsinn</nachname>
    <laptops>
      <laptop lid="111">Thinkpad</laptop>
    </laptops>
  </student>
</students>
 ');

-- all students
SELECT xpath('/students', c) FROM students;
-- first student (entire record)
SELECT xpath('/students/student[position()=1]', c) FROM students;
-- matriculation # of the first student
SELECT xpath('/students/student[position()=1]/matnr/text()', c) FROM students;
-- record for the laptop with lid 222
SELECT xpath('//laptop[@lid=222]', c) FROM students;
-- first name of the student with two laptops
SELECT xpath('//*[count(laptop)=2]/parent::student/firstname/text()', c) FROM students;