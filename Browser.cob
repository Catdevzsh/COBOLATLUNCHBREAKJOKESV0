       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRON.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WEB-CONTENT ASSIGN TO 'web-content.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  WEB-CONTENT.
       01  WEB-CONTENT-REC PIC X(100).

       WORKING-STORAGE SECTION.
       01  WS-EOF        PIC X VALUE 'N'.
           88  EOF       VALUE 'Y'.
           88  NOT-EOF   VALUE 'N'.
           88  WS-EOF    VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           OPEN INPUT WEB-CONTENT
           PERFORM UNTIL EOF
               READ WEB-CONTENT INTO WEB-CONTENT-REC
                   AT END
                       SET EOF TO TRUE
                   NOT AT END
                       DISPLAY WEB-CONTENT-REC
               END-READ
           END-PERFORM
           CLOSE WEB-CONTENT
           STOP RUN.
