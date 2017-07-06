#!/usr/bin/perl

#Use Prima // http://www.prima.eu.org
# unix/windows version

use v5.14;
use Prima qw (Application);
Prima::MainWindow-> new (text => "Hello world!");
run Prima;
