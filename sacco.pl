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
    nl, write("Enter 'ddd' to delete driver details"),
 
    nl, write("Enter 'enl' to enter new location"),
    nl, write("Enter 'dll' to delete location"),

    nl, write("Enter 'enr' to enter route "),
    nl, write("Enter 'dlr' to enter route "),

    nl, write("Enter 'hlp' to display this menu"),nl,
    nl, write("Enter 'quit' to stop"),nl,
    nl.


enb:- write('Enter Bus Registration Number:'),nl,read(RegNo),nl,write('Enter Driver Name:'),nl,read(DriverName),nl,write('Enter Starting Point:'),nl,read(StartPoint),nl,write('Enter Destination:'),nl,read(Destination),nl,saveBus(DriverName,RegNo,StartPoint,Destination). 

/*Associate bus with a driver*/
/*If the driver and route exist add bus*/
saveBus(DriverName,RegNo,StartPoint,Destination):- route(Destination,StartPoint),driver(DriverName),write(DriverName),write(' drives '),write(RegNo),write(' from '),write(StartPoint),write(' to '),write(Destination),nl,assertz(bus(RegNo,DriverName,StartPoint,Destination)).


/*Add New Driver*/
end:- write('Enter Driver Name:'),nl,read(DriverName),assertz(driver(DriverName)).
/*Delete Driver if they exist*/
ddd:- write('Enter Driver Name to delete:'),nl,read(DriverName),driver(DriverName),retract(driver(DriverName)),write('Successfully deleted '),write(DriverName).


/*Add new location*/
enl:- write('Enter Location:'),nl,read(Location),assertz(location(Location)).
/*Delete location if it exists*/
dll:- write('Enter Location to Delete:'),nl,read(Location),location(Location),retract(location(Location)),nl,write('Successfuly deleted '),write(Location).


/*Associate location with a route*/
/*If the locations exist save it as a route*/
saveRoute(To,From):- location(To),location(From),write('From '),write(From),write(' to '),write(To),nl,assertz(route(To,From)).
deleteRoute(To,From):- location(To),location(From),retract(route(To,From)),write('Successfully deleted route').


/*Add new route*/
enr:- write('Enter Start point:'),nl,read(StartPoint),write('Enter End point:'),nl,read(EndPoint),saveRoute(EndPoint,StartPoint).
/*Delete route if it exists*/
dlr:- write('Enter Route Start point:'),nl,read(StartPoint),write('Enter Route End point:'),nl,read(EndPoint),deleteRoute(EndPoint,StartPoint).


hlp:- menu.


loop(0).  
loop(N) :- N>0, write('value of N is: '), write(N), nl,
S is N-1,
loop(S).  