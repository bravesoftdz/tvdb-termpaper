myodbc-installer.exe -d -a -n "MySQL ODBC Driver 5.1" -t "DRIVER=myodbc5.dll;SETUP=myodbc5S.dll"
myodbc-installer.exe -s -a -c1 -n "tvdatabase" -t "DRIVER=MySQL ODBC Driver 5.1;SERVER=localhost;DATABASE=tvdatabase;"
myodbc-installer.exe -s -a -c2 -n "tvdatabase" -t "DRIVER=MySQL ODBC Driver 5.1;SERVER=localhost;DATABASE=tvdatabase;"
