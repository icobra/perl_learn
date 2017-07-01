#!/usr/bin/perl
use v5.14;

# Calculator program where the user can enter the operation
# enter the required number and get the result.
# Addition,subtraction,multiplication,division, exponentiation,
# sin, cos and tang of number.

# Программа калькулятор, где пользователь может ввести операцию,
# ввести необходимые числа и получить результат.
# Сложение,вычитание,умножение,деление, возведение в степень,
# синус, косинус и тангенс числа.

my $input_string;

say "Hello! Input string as \"x + y\" or \"sin x\" \n";
say 'You can use "+", "-", "*", "\", "**", "sin", "cos", "tan"';
$input_string = <STDIN>;

# Use split to split the lines by space symbols.
# Разбиваем ввод на переменные по пробелу.
my ($first_arg, $second_arg, $third_arg) = split' ', $input_string;

# If the first character is the number of execution algebra.
# Otherwise, perform trigonometry.
# Если первый символ число выполняем алгебру.
# Иначе выполняем тригонометрию.
if ($input_string =~ m/^(\d)/) {
     algebra($first_arg, $second_arg, $third_arg);
     } else {
     trigonometry($first_arg, $second_arg);

     }
# Function for working with algebraic expressions.
# Функция для для работы с алгебраическими выражениями.
sub algebra
    {
    if ($second_arg eq "+")
        {
        say "$first_arg" + "$third_arg";
        }
    elsif ($second_arg eq "-")
        {
        say "$first_arg" - "$third_arg";
        }
    elsif ($second_arg eq "*")
        {
        say "$first_arg" * "$third_arg";
        }
    elsif ($second_arg eq "/")
       {
       say "$first_arg" / "$third_arg";
       }
    elsif ($second_arg eq "**")
       {
       say "$first_arg" ** "$third_arg";
       }
    else
       {
       say "The string entered in the incorrect form.";
       }
    }

# A function to work with trigonometry
# Perl can calculate sin and cos without any additional libraries.
# The answer in radians.
# Функция для работы с тригонометрией
# Perl может вычислять sin и cos без дополнительных библиотек.
# Ответ в радианах.
sub trigonometry
    {
    if ($first_arg eq "sin")
        {
        say "sin $second_arg = ", sin "$second_arg", " rad";
        }
     elsif ($first_arg eq "cos")
         {
         say "cos $second_arg = ", cos "$second_arg" , " rad";
         }
     elsif ($first_arg eq "tan")
         {
         my $sin_second = sin $second_arg;
         my $cos_second = cos $second_arg;
         say "tan $second_arg = ", "$sin_second" / "$cos_second", " rad";
         }
     else
        {
        say "The string entered in the incorrect form.";
        }
     }
