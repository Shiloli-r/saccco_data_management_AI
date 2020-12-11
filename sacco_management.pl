%%
% CSC 312 Project
% Question: Write a program that assists a medium sized transport sacco
% to manage its data
% Written by Ronald Onami, Ian Nalyanya and Casey Tiben
%
% ===> To start the program run start, which will give more information
%
%


start:- write("\e[2J"), nl,
    write("Welcome to the Sacco Data Management System"),
    nl, write("Enter 'read_bus' to enter bus data "),
    nl, write("Enter 'read_driver to enter driver data "),
    nl, write("Enter read_route to enter route data "),
    nl.


% Bus Data Entry
read_bus:- getBusDetails(RegNumber),
            \+ RegNumber = quit,
                 nl, saveBusDetails(RegNumber), read_bus.

getBusDetails(RegNumber) :- write("Enter the registration Number of the Bus (Enter 'quit' to stop):  "), read(RegNumber), nl.

saveBusDetails(RegNumber):-  assertz(bus(RegNumber)).

% Driver Data Entry
read_driver :- getDriverDetails(Name),
               \+ Name = quit,
               nl, saveDriverDetails(Name), read_driver.

getDriverDetails(Name) :- write("Enter Driver's Name (Enter 'quit' to stop): "), read(Name), nl.

saveDriverDetails(Name) :- assertz(driver(Name)).


%Route Data Entry
%i
%
read_route :- getRouteDetails(From, To),
               \+ From = quit,
              % \+ To = quit,
               nl, saveRouteDetails(From, To), read_route.

getRouteDetails(From, To) :- write("From (Enter 'quit' to stop): "), read(From), nl,
 write("To (Enter 'quit' to stop):  "), read(To),nl.

saveRouteDetails(From, To) :- assertz(route(From, To)).
