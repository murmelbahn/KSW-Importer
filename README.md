# KSW-Importer
A simple powershell script to create a valid xml file for exclusions in Kaspersky Server for Windows

You can create an input file easily by using the windows build in dir command. Something like:
dir /s/b *.exe -> exclusionlist.txt

How to use:

Simply execute create_trusted_files.ps1 from powershell. You musst use parameters for input and output file.

Example: ./create_trusted_files.ps1 -in exclusionlist.txt -out exclusions.xml

The input file musst be a simple text file which contains one file to exclude per line.
The output file musste be a xml file.

Works for KSC10 SP3!
