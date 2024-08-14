course_details(ai,time(monday,2,5),teacher(s,b),loc(cme6150)).
course_details(dm,time(tuesday,9,11),teacher(s,s),loc(ictb11)).
course_details(dbms,time(thrusday,9,12),teacher(k,p),loc(ictb05)).
course_details(oops,time(friday,9,12),teacher(r,k),loc(ictb03)).
teacher_course(L,L1,C):-course_details(C,_,teacher(L,L1),_).
teacher_on_day(L1,D,C):-course_details(C,time(D,_,_),teacher(_,L1),_).
duration(C,D):-course_details(C,time(_,S,F),_,_),D is F-S.

