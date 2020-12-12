/*
write('Enter Vehicle No'),nl.
read(VehicleNo).


write('Enter Driver Name'),nl.
read(DriverName).

write('Enter Tout Name'),nl.
read(ToutName).
*/


start:- write("\e[2J"), nl,
    write("Welcome to the Sacco Data Management System"),nl,menu.
    

menu:- write("Enter 'enb' to enter bus data"),

    nl, write("Enter 'end' to enter driver details"),
 
    nl, write("Enter 'enl' to enter new location"),

    nl, write("Enter 'enr' to enter route "),

    nl, write("Enter 'hlp' to display this menu"),nl,
    nl, write("Enter 'quit' to stop"),nl,
    nl.


enb:- write('Enter Bus Registration Number:'),nl,read(RegNo),nl,write('Enter Driver Name:'),nl,read(DriverName),nl,write('Enter Starting Point:'),nl,read(StartPoint),nl,write('Enter Destination:'),nl,read(Destination),nl,saveBus(DriverName,RegNo,StartPoint,Destination). 

/*Associate bus with a driver*/
/*If the driver and route exist add bus*/
saveBus(DriverName,RegNo,StartPoint,Destination):- route(Destination,StartPoint),driver(DriverName),write(DriverName),write(' drives '),write(RegNo),write(' from '),write(StartPoint),write(' to '),write(Destination),nl,assertz(bus(RegNo,DriverName,StartPoint,Destination)).


end:- write('Enter Driver Name:'),nl,read(DriverName),assertz(driver(DriverName)).


/*Add new location*/
enl:- write('Enter Location:'),nl,read(Location),assertz(location(Location)).


/*Associate location with a route*/
/*If the locations exist save it as a route*/
saveRoute(To,From):- location(To),location(From),write('From '),write(From),write(' to '),write(To),nl,assertz(route(To,From)).

/*Add new route*/
enr:- write('Enter Start point:'),nl,read(StartPoint),write('Enter End point:'),nl,read(EndPoint),saveRoute(EndPoint,StartPoint).


hlp:- menu.


loop(0).  
loop(N) :- N>0, write('value of N is: '), write(N), nl,
S is N-1,
loop(S).  