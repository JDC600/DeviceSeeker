from re import search
import subprocess, sys


PSscript = "./ips.ps1"

PSprocess = subprocess.Popen(["powershell.exe", PSscript], stdout = sys.stdout)

PSprocess.communicate()


with open("MACs.txt") as MACsFile:
    linesMACs = [ lineMAC.rstrip().upper().replace("-", ":")[0:8] for lineMAC in MACsFile ]


manuf = open('manuf.txt', 'r')

linesManuf = manuf.readlines()

with open("IPs.txt") as IPsFile: 

    linesIPs = [ lineIPs.rstrip() for lineIPs in IPsFile ]

def nested_list_contains(linesManuf, target):
    for lineManuf in linesManuf:
        if target in lineManuf:
            return lineManuf
    return "No encontrado"
for i in range(len(linesMACs)):
    print(linesIPs[i] + ":",nested_list_contains(linesManuf, linesMACs[i]))  # True