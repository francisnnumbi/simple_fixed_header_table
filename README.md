# simple_fixed_header_table

A Flutter tutorial showcasing the use of simple table to achieve the fixed headed table.

## Getting Started

At the end of this tutorial, you will be able to create a simple fixed header table in Flutter.
The table will have simple data and a fixed header.
It will have 3 basic attributes :

1. columnWidths : to set the width of each column
2. header : to set the header of the table, which is the TableRow
3. rows : to set the rows of the table, which is the List of TableRow

## Prerequisites

For the sake of the tutorial you will need the following libraries in your pubspec.yaml file:

1. faker : ^2.1.0 to generate fake data
2. collection_ext: ^1.0.0 to use an indexed map

## The Output

```
FixedHeaderTable(
  columnWidths: {},
  header: TableRow(children: []),
    rows: <TableRow>[],
)
```
