#!/bin/bash

# -----------------------------------------------------------------------------
# simplest_db.sh
#
# Author: SaptHrishi (Hrishabh Mishra)
#
# A minimal key-value database implemented using a plain text file.
#
# Functions:
#   db_set <key> <value>
#       Appends a key-value pair to the "database" file.
#
#   db_get <key>
#       Retrieves the most recently stored value for the given key.
#
# Data format:
#   key,value
#
# Example:
#   db_set name Alice
#   db_set age 25
#   db_get name    # Outputs: Alice
#
# Note:
#   - Values are appended; old values are never overwritten.
#   - db_get returns the latest value using `tail -n 1`.
# -----------------------------------------------------------------------------

db_set () {
	echo "$1,$2" >> database
}

db_get () {
	grep "^$1," database | sed -e "s/^$1,//" | tail -n 1
}
