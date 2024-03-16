IDENTIFICATION DIVISION.
PROGRAM-ID. PORT-FORWARDING-TOOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 PORT-NUMBER-IN PIC 9(5).
01 PORT-NUMBER-OUT PIC 9(5).
01 SERVER-IP-IN PIC X(15).
01 SERVER-IP-OUT PIC X(15).
01 CLIENT-IP PIC X(15).
01 CHOICE PIC X.

PROCEDURE DIVISION.
MAIN-PROGRAM.
    DISPLAY "Welcome to the Simple Port Forwarding Tool.".
    PERFORM INPUT-DATA.
    PERFORM FORWARD-PORT.
    PERFORM ASK-TO-CONTINUE.
    IF CHOICE = 'Y' OR CHOICE = 'y'
        THEN GO TO MAIN-PROGRAM
    ELSE
        STOP RUN.

INPUT-DATA.
    DISPLAY "Enter the incoming port number:".
    ACCEPT PORT-NUMBER-IN.
    DISPLAY "Enter the outgoing port number:".
    ACCEPT PORT-NUMBER-OUT.
    DISPLAY "Enter the IP address of the server for incoming requests:".
    ACCEPT SERVER-IP-IN.
    DISPLAY "Enter the IP address of the server for outgoing requests:".
    ACCEPT SERVER-IP-OUT.
    DISPLAY "Enter the client IP address (optional, press Enter to skip):".
    ACCEPT CLIENT-IP.

FORWARD-PORT.
    DISPLAY "Port Forwarding in progress...".
    DISPLAY "Incoming port" PORT-NUMBER-IN "forwarded to" SERVER-IP-IN "on port" PORT-NUMBER-OUT.
    IF CLIENT-IP = SPACES
        THEN DISPLAY "All incoming requests will be forwarded."
    ELSE
        DISPLAY "Requests from client IP" CLIENT-IP "will be forwarded.".

ASK-TO-CONTINUE.
    DISPLAY "Do you want to continue? (Y/N)".
    ACCEPT CHOICE.

END PROGRAM PORT-FORWARDING-TOOL.
