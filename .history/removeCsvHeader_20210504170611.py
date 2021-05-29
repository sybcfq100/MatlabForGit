# -*- coding: utf-8 -*-
"""
@Time        : 10/11/2020
@Author      : sybcf
@File        : removeCsvHeader
@Description : 
"""
# removes the header from all csv files in the current
# woring dirctory
'''
import csv
import os

os.makedirs('headerRemoved', exist_ok=True)

for csvFilename in os.listdir('.'):
    if not csvFilename.endswith('.csv'):
        continue

    print('Removing header from ' + csvFilename + '...')
# read the csv file in
csvRows = []
#csvFilename = 'C:/Users/sybcf/Desktop/wm2'
csvFileObj = open(csvFilename)
readerObj = csv.reader(csvFileObj)
for row in readerObj:
    if readerObj.line_num == 1:
        continue
    csvRows.append(row)
csvFileObj.close()
# write the csv file in
csvFileObj = open(os.path.join('headerRemoved', csvFilename), 'w', newline = '')
csvWriter = csv.writer(csvFileObj)
for row in csvRows:
	csvWriter.writerow(row)
csvFileObj.close()
'''

#! python3
# removeCsvHeader.py - Removes the header from all CSV files in the current
# working directory.

import csv, os

os.makedirs('headerRemoved', exist_ok=True)

# Loop through every file in the current working directory.
for csvFilename in os.listdir('.'):
    if not csvFilename.endswith('.csv'):
        continue # skip non-csv files

    print('Removing header from ' + csvFilename + '...')

    # Read the CSV file in (skipping first row).
    csvRows = []
    csvFileObj = open(csvFilename)
    readerObj = csv.reader(csvFileObj)
    for row in readerObj:
        entry = [i[0] for i in row]
        if entry[0].isdigit() is False:
            continue # skip first row
        c1 = [i[0:11] for i in row]
        for c11 in c1:
            c1 = float(c11)
        c2 = [i[14:] for i in row]
        for c22 in c2:
            c2 = float(c22)
        row = [c1, c2]

        csvRows.append(row)
    csvFileObj.close()

    # Write out the CSV file.
    csvFileObj = open(os.path.join('headerRemoved', csvFilename), 'w', newline='')
    csvWriter = csv.writer(csvFileObj)
    for row in csvRows:
        csvWriter.writerow(row)
    csvFileObj.close()
