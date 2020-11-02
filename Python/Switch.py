class Switch:
    # Switch Object
    def __init__(switch, name, vendor, interfaces):
        switch.name = name
        switch.vendor = vendor
        switch.interfaces = []

    def showNet(switch, i):
        print("Hostname: " + switch.name)
        print("Manufacturer: " + switch.vendor)

        print ("--- Active Interfaces ---")          
     
class Interface:
    # Interface Object
    def __init__(interface, name, ip, mask):
        interface.name = name
        interface.ip = ip
        interface.mask = mask

    def getDetails(interface):
        print(interface.name + " " + interface.ip + " " + interface.mask)

f00 = Interface("F0/0", "192.168.0.40", "255.255.255.0")
f01 = Interface("F0/1", "192.168.0.50", "255.255.255.0")

s1 = Switch("SW1", "Cisco", [f00, f01])

s1.showNet()