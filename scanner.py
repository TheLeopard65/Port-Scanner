#!/bin/python3
import sys, socket
from datetime import datetime

def banner():
    print("#" * 35)
    print("TARGET (TEXT) : " + sys.argv[1])
    print("TARGET (IP): " + target)
    print("START TIME : " + str(datetime.now()))

def scan(target):
    try:
        if (sys.argv[2] == "full"):
            print("SCAN TYPE : FULL")
            print("PORTS : 1-65535")
            print("-" * 35)
            for port in range(1,65535):
                s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                socket.timeout()
                result = s.connect_ex((target, port))
                if result == 0:
                    print(f"PORT {port} : OPEN ✅")
                s.close()
        elif (sys.argv[2] == "half"):
            print("SCAN TYPE : HALF")
            print("PORTS : 1-1024")
            print("-" * 35)      
            for port in range(1,1024):
                s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                socket.timeout()
                result = s.connect_ex((target, port))
                if result == 0:
                    print(f"PORT {port} : OPEN ✅")
                s.close()
        else:
            print("SYNTAX : python3 scanner.py <target> <full/half>")
        
    except KeyboardInterrupt:
        print("Exiting Scanner")
        sys.exit()
        
    except socket.gaierror:
        print("ERROR : HOST could bot be Resolved")
        sys.exit()
        
    except socket.error:
        print("ERROR : Could not connect to the Target")
        sys.exit()
        
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("SYNTAX : python3 scanner.py <target> <full/half>")
    else:
        target = socket.gethostbyname(sys.argv[1])
        banner()
        scan(target)
