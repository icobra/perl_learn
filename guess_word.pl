#!/usr/bin/perl
use v5.22;

=head
Игра угадай слова

Версия 0.8
=cut

sub HelloPlayer{
	my $hellomessage = <<END;

Приветствую тебя в игре "угадай слово"

END
    print $hellomessage;	
}

sub HangMan{
	my ($try) = @_ ;
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
    print @HangMan[$try];	
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
    my $start = 0;
    my $try = 0;
	while ($long > 0){
	    if (substr($word, $start, 1) eq $symbol){
            substr($secreet_word, $start, 1) = $symbol;
            $try++;
        }
        else{
            # enter your code;    
        }
        $long--;
        $start++;
    }
    if ($try > 0){
    	$try = 0;
    }
    else{
    	$try = 1;
    }

    return $secreet_word, $try;
}

sub FullWord{
	my ($secreet_word, $word) = @_ ;
	my $StatusOfGame = 0;
    if ($secreet_word eq $word){
        return $StatusOfGame = 0;
    }
    else{
	    return $StatusOfGame = 1;
    }
}

sub MakeSecreetWord{
    my ($len, $word) = @_ ;
    my $start = 0;
    my $long = $len;
    my $secreet_word = "";

    while ($long > 0){
	    $secreet_word = $secreet_word . "*";
	    $long--;
    }
    return $secreet_word;
}

my $PlayAgain = "yes";
while ($PlayAgain eq "yes" or $PlayAgain eq "y"){
    HelloPlayer;
    my $word = WordsForGame;
    my $len = length($word);
    my $secreet_word = MakeSecreetWord($len, $word);
    #прооверить где используется
    my $long = $len;
    my $try = 0;
    my $next_try = 0;

    my $symbol="";
    say $secreet_word;
    say "Мы в основном цикле игры";
    my $StatusOfGame = 1;
    while ($StatusOfGame > 0) {
    	HangMan($try);
    	say "Введите маленькую букву из этого слова на английском";
        chomp($symbol=<STDIN>);
        ($secreet_word, $next_try) = CheckChar($len, $secreet_word, $word, $symbol);
        $try = $try + $next_try;
        say $try;
        if ($try == 5){
        	HangMan($try);
        	say "Game Over";
        	last;
        }
        say "пороверка";
        say $secreet_word;
        say $word;
        say "проверка";
        $StatusOfGame = FullWord($secreet_word, $word);
    }

    say "Хотите играть yes или no?";
    chomp($PlayAgain=<STDIN>);
}