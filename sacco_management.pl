% CSC 312 Project
% Question: Write a program that assists a medium sized transport sacco
% to manage its data
% Written by Ronald Onami, Ian Nalyanya and Casey Tiben
%
% ===> To start the program run start, which will give more information

start:- write("\e[2J"), nl,
    write("Welcome to the Sacco Data Management System"),
    nl, write("Enter 'read_bus' to enter bus data "),
    nl, write("Enter 'delete_bus' to delete a bus"),
    nl, write("Enter 'showBus' to see all buses"),nl,
    nl, write("Enter 'read_driver to enter driver data "),
    nl, write("Enter 'delete_driver' to delete a driver"),
    nl, write("Enter 'showDriver' to show all drivers "), nl,
    nl, write("Enter 'read_route' to enter route data "),
    nl, write("Enter 'delete_route' to delete route data "),
    nl, write("Enter 'showRoute' to show all routes "), nl,
    nl, write("Enter 'connect' to connect bus, driver and route"),
    nl, write("Enter 'showConnections' to show available connections "),nl,
    nl, nl, write("ATTEMPTING TO VIEW RECORDS WITHOUT CREATING THEM MAY RESULT IN ERRORS!!!!"),nl,
    nl.

%-----------------------  BUS MANAGEMENT -------------------------------
% Bus Data Entry
read_bus:- getBusDetails(RegNumber),
            \+ RegNumber = quit,
                 nl, saveBusDetails(RegNumber), read_bus.

getBusDetails(RegNumber) :- write("Enter the registration Number of the Bus (Enter 'quit' to stop):  "), read(RegNumber), nl.

saveBusDetails(RegNumber):-  assertz(bus(RegNumber)).


% Bus Data Deletion
delete_bus :- getBusDetails(RegNumber),
            \+ RegNumber=quit, nl,
            deleteBus(RegNumber), delete_bus.
deleteBus(RegNumber) :- retract(bus(RegNumber)).

%    SHOW BUSES
showBus :- write("Registered Buses: "), nl, bus(_), forall(bus(X), printBus(X)).
printBus(X):- format("---> bus(~w)", [X] ),nl.

%-----------------  DRIVER MANAGEMENT ----------------------------------
% Driver Data Entry
read_driver :- getDriverDetails(Name),
               \+ Name = quit,
               nl, saveDriverDetails(Name), read_driver.

getDriverDetails(Name) :- write("Enter Driver's Name (Enter 'quit' to stop): "), read(Name), nl.

saveDriverDetails(Name) :- assertz(driver(Name)).

% Driver Data Deletion
delete_driver:- getDriverDetails(Name),
                \+ Name = quit,
                nl, deleteDriver(Name), delete_driver.


deleteDriver(Name):- retract(driver(Name)).

%    SHOW DRIVER
showDriver :- write("Registered Drivers: "), nl, forall(driver(Name), printDriver(Name)).
printDriver(Name):- format("---> driver(~w)", [Name] ),nl.


% ------------  ROUTE MANAGEMENT ------------------------------------
%Route Data Entry
read_route :- getRouteDetails(From, To),
               \+ From = quit,
              % \+ To = quit,
               nl, saveRouteDetails(From, To), read_route.

getRouteDetails(From, To) :- write("From (Enter 'quit' to stop): "), read(From), nl,
 write("To (Enter 'quit' to stop):  "), read(To),nl.

saveRouteDetails(From, To) :- assertz(route(From, To)).

% Route Data Deletion

delete_route:- getRouteDetails(From, To),
               \+ From = quit,nl,
               deleteRoute(From, To), delete_route.
deleteRoute(From, To) :- retract(route(From, To)).

%    SHOW ROUTE
showRoute :- write("Registered Drivers: "), nl, forall(route(From, To), printRoute(From, To)).
printRoute(From, To):- format("---> route(~w, ~w)", [From, To] ),nl.


% --------------- CONNECT BUS, DRIVER AND ROUTE ---------------
showConnections:- write("Available Connections: "),nl, forall(connections(Bus, Driver, From, To), format("====> connection(~w, ~w, ~w, ~w )", [Bus, Driver, From, To])).

connect:- getConnection(Bus, Driver, From, To), saveConnection(Bus, Driver, From, To), nl.

getConnection(Bus, Driver, From, To):- write("Enter The Bus: "),read(Bus),nl, write("Enter The Driver: "), read(Driver),nl,
    write("From: "), read(From), nl, write("To: "), read(To), nl.

saveConnection(Bus, Driver, From, To) :-  assertz(connections(Bus, Driver, From, To)),nl.
