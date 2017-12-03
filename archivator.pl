#!/usr/bin/perl
use v5.14;
=head
Задача "Архиватор"

На вход подаётся массив целых положительных чисел от 0 до 255. Архиватор должен:
1) заменить все числа от 0 до 254, которые повторяются больше 3, но меньше 255 раз, на последовательность "255, число, количество повторов"
2) Заменить все числа 255, повторяющиеся от 1 до 254 раз включительно на "255,255, число повторов"
=cut

my @array = qw/2 2 2 1 4 4 4 4 5 5 5 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255/;
my @array_out;

print "@array \n";
my $size = @array;
say "Len of size $size";

my $j;
my $k;

for (my $i = 0; $i <= $size; $i++) {
   my $arg = @array[$i];
   if ($j == $arg) {
       $j = $arg;
       $k++;
       if ($k == 254) {
           push (@array_out, 255, $j, 254);
           undef $k;
       } else {
       }
    } else {
       if ($j == 255){
           $k++;
           push (@array_out, 255, 255, $k);
       } else {
           if ($k > 2) {
               $k++;
               push (@array_out, 255, $j, $k);
           }else {
               $k++;
               push (@array_out, ($j)x $k);
           }

       }
       $j = $arg;
       undef $k;
   }
};

print "@array_out \n";
