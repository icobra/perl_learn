#!/usr/bin/perl
use v5.20;

# Приветствие игрока
say "Привет, как тебя зовут?";
my ($name, $number);
chomp($name = <STDIN>);
print "Хорошо, $name, я загадал число от 0 до 20.\n";
my $random_number = int(rand(20));

for (my $i=0; $i < 5; $i ++){
   print "Как ты думаешь, что это за число?\n";
   chomp($number = <STDIN>);
   if ($number < $random_number){
       say "Твоё число меньше";
   }elsif ($number > $random_number){
       say "Твоё число больше";
   }else {
       last;}
}    

if ($number == $random_number){
   print "Ты угадал число \n";
}else{
   print "Ты не угалал, я загадал число ". $random_number ."\n";
}