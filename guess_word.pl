#!/usr/bin/perl
use v5.22;

=head
Игра угадай слова

Версия 0.02
=cut

sub HelloPlayer{
	my $hellomessage = <<END;

Приветствую тебя в игре "угадай слово"

END
    print $hellomessage;	
}

sub CheckChar{
	my ($long, $secreet_word, $word, $symbol) = @_ ;

=head	
	$long = @_[0];
	$secreet_word = @_[1];
	$word = @_[2];
	$symbol = @_[3];
=cut 
    my $start = 0;
	while ($long > 0){
	    if (substr(@_[2], $start, 1) eq @_[3]){
            substr(@_[1], $start, 1) = @_[3];
        }
        else{
	        say "no";
        }
        $long--;
        $start++;
    }
    return @_[1],@_[2];
}

sub FullWord{
	my ($count, $ord) = @_ ;
	my $start = 0;
	my $star = '*';
	my $StatusOfGame = 0;
	while($count > 0){
	    if (substr($ord, $start, 1) eq $star){
            return $StatusOfGame = 1;
        }
        else{
	        say "no";
        }
		$count--;
        $start++;
    }
    return $StatusOfGame = 0;
}

my $word = "moloko";
my $secreet_word = "";
my $start = 0;
my $len = length($word);
my $long = $len;

while ($long > 0){
	$secreet_word = $secreet_word . "*";
	$long--;
}
$long = $len;

my $symbol="";

say "Мы еще не в игре";
say $word; say $secreet_word;

my $PlayAgain = "yes";
while ($PlayAgain eq "yes" or $PlayAgain eq "y"){
    HelloPlayer;
    
    my $temp;
    my $temp1;
    say $secreet_word;
    say "Мы в основном цикле игры";
    my $StatusOfGame = 1;
    while ($StatusOfGame > 0) {
    	say "Введите маленькую букву из этого слова на английском";
        chomp($symbol=<STDIN>);
        my ($temp, $temp1) = CheckChar($long, $secreet_word, $word, $symbol);
        $secreet_word = $temp;
        $word = $temp1;
        say "Искомое слово";
        say $secreet_word;
       $StatusOfGame = FullWord($long, $temp);
    }


    say "Хотите играть yes или no?";
    chomp($PlayAgain=<STDIN>);
}