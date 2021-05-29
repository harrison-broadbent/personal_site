---
title: Reading and writing CSV files in Python
date: 2021-05-21
keywords: python, csv, read csv python, write csv python
description: Reading and writing to CSV files using Python.
tags:
  - technical
  - programming
  - python
---

So you want to read/write CSV files?
And you're using Python?

Great. You're in the right place.

We're going to go over two example programs — the first program reads a CSV, the second writes one.

#### Note:

> These examples target Python3 (3.9.5), but older versions of Python3 should be fine.

> Reading through the [Python2.7 documentation](https://docs.python.org/2.7/library/csv.html), these examples should also be Python2.7 compatible, but no promises.

## Reading from a CSV

For demo purposes, here's a sample of the CSV we're going to read.
We'll generate this file ourselves in the second example -

`test_file.csv` -

| Time,  | Voltage |
| ------ | ------- |
| 0.104, | 0.009   |
| 0.204, | 0.544   |
| 0.309, | 0.312   |

The following code reads through the CSV named `test_file.csv` -

<!-- prettier-ignore -->
~~~python
"""
Reading a CSV file line-by-line.
Tested with Python 3.9.5.
Harrison Broadbent.
"""

import csv

# Open the file test_file.csv for reading
with open('test_file.csv', mode='r') as file:

  # create an iterable for each row in the file
  reader = csv.reader(file)

  # Get the first item from the iterable - 
  # this gets the headers seperately
  header = next(reader)
  print(header)


  # iterate through every row and print them out
  for row in reader:
    print(row)

"""
INPUT: 
  Comma-separated CSV file.

OUTPUT: 
  ['Time', 'Voltage']
  ['0.104', '0.009']  <-- Strings?
  ['0.204', '0.544']  <-- Indeed.
  ['0.309', '0.312']  <-- We need to parse them ourself.
"""
~~~

<!-- prettier-ignore-end -->

- This program assumes that the first line of the CSV is column headers, and reads, stores, and prints them separately. This is done on `lines 18-19`.

- Then, it goes through each line of the file and prints them out, on `lines 23-24`.

You might have noticed that each `row` that we print is an array of strings. `csv.reader()` will read every row like this.

It's our job to parse the data into its correct type.

By changing `line 24` from above to the following, we can parse each row element to a `Float` -

<!-- prettier-ignore -->
~~~python

# Change line 24 from above to the line below
# to parse our inputs from strings to floats.
print([float(i) for i in row])

"""
OUTPUT: 
  ['Time', 'Voltage']
  [0.104, 0.009]  <-- Floats!
  [0.204, 0.544]  <-- More of them!
  [0.309, 0.312]  <-- ^o^
"""
~~~

<!-- prettier-ignore-end -->

`[float(i) for i in row]` is an example of a list comprehension in Python.

It constructs a new array from the elements in `row`, by going through them individually and converting them all to type `Float`.

## Writing to a CSV

The following code writes the `test_file.csv` CSV from above -

#### Note:

> The CSV file from above had values rounded to 3 decimal places. The following program does not round values.

<!-- prettier-ignore -->
~~~python
"""
Writing to a CSV file line-by-line.
Tested with Python 3.9.5.
Harrison Broadbent.
"""

import csv, time, random

# Open a new file called 'test_file.csv' and start writing to it.
with open('test_file.csv', mode='w') as file:

  # store the start time for the program
  # we'll use this to find ∆time
  start_time = time.time()
  # setup an object to help us write to our CSV file.
  writer = csv.writer(file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
  # Write a header row to our CSV file.
  writer.writerow(['Time', 'Voltage'])

  # Indefinitely write lines to our CSV file
  while True:
    # setup a row with ∆time and a random value
    row = [time.time() - start_time, random.random()]
    # write the row to our file
    writer.writerow(row)
    # print out the row
    print(row)
    # sleep for 100ms
    time.sleep(0.1)
~~~

<!-- prettier-ignore-end -->

Before I explain the above program, I'll share the motivation behind it, because it's got a few quirks -

> This piece of code was originally used to read voltage values from an electrical circuit, which were then plotted against time.

> The only modification made to the file from the original use-case, occurred on `line 23`. I modified it to insert a random value, rather than the reading of the circuit voltage.

> Hence why we go to the effort of calculation ∆time, and why we write to the file indefinitely.

Onto the explanation -

- `line 11` opens our file in `'w' -> write` mode, which automatically creates our file if it doesn't exist, or overwrites it if it does.

- `line 17` initializes a `csv.writer` with sane defaults, and then on `line 19` we write a row of headers to our CSV file.

- From `line 22-30`, we continuously write rows of data in the form of `[∆time, value]` to our file, printing them out as we go, and then waiting 100ms between each write.

## Further Reading

> [DictReader](https://docs.python.org/3/library/csv.html#csv.DictReader) - a different way of reading files using Python's `csv`.
