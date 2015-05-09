#!/bin/bash

read_lst () {
    grep -vE "^(\s*$|#)" ${1}
}
