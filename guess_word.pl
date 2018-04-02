#!/usr/bin/perl
use v5.22;

=head
Игра угадай слова

Версия 0.5
=cut

sub HelloPlayer{
	my $hellomessage = <<END;

Приветствую тебя в игре "угадай слово"

END
    print $hellomessage;	
}

sub HangMan{
    my @HangMan;

	$HangMan[0] = "+-----+\n|\n|\n|\n|\n|\n|\n======\n";
	$HangMan[1] = "+-----+\n|     |\n|\n|\n|\n|\n|\n======\n";
	$HangMan[2] = "+-----+\n|     |\n|     0\n|\n|\n|\n======\n";
    $HangMan[3] = "+-----+\n|     |\n|     0\n|    /|\\\n|\n|\n======\n";
    # Use "."" to connatation string and use 80 char on string format
    # Используем "." для объединения строк и соблюдения 80 символов в строку
    $HangMan[4] = "+-----+\n|     |\n|     0\n|    /|\\\n|     |\n|\n" .
        "======\n";
    $HangMan[5] = "+-----+\n|     |\n|     0\n|    /|\\\n|     |\n" .
        "|    / \\\n|\n======\n";
    print @HangMan;	
}

sub WordsForGame {

    # 64 words
    my @words = qw "ant baboon badger bat bear beaver camel cat clam cobra 
        cougar coyote crow deer dog donkey duck eagle ferret fox frog goat 
        goose hawk lion lizard llama mole monkey moose mouse mule newt otter 
        owl panda parrot pigeon python rabbit ram rat raven rhino salmon seal 
        shark sheep skunk sloth snake spider stork swan tiger toad trout 
        turkey turtle weasel whale wolf wombat zebra";
    say $words[10];
    say $words[11];
    say $words[63];

    my $random_number = int(rand(63));

    say $words[$random_number];
    return $words[$random_number];
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

my $word = WordsForGame;
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

WordsForGame;

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