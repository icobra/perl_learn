#!/usr/bin/perl
use v5.22;

=head
Игра угадай слова

Версия 0.9
=cut

sub HangMan{
	# Draw HangMan / Рисует человечка
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
    # 64 words vocbulare / Словарь для игры из 64 слов
    my @words = qw "ant baboon badger bat bear beaver camel cat clam cobra 
        cougar coyote crow deer dog donkey duck eagle ferret fox frog goat 
        goose hawk lion lizard llama mole monkey moose mouse mule newt otter 
        owl panda parrot pigeon python rabbit ram rat raven rhino salmon seal 
        shark sheep skunk sloth snake spider stork swan tiger toad trout 
        turkey turtle weasel whale wolf wombat zebra";
    my $random_number = int(rand(63));
    say $words[$random_number];    #Test
    return $words[$random_number];
}

sub CheckChar{
	my ($len, $secreet_word, $word, $symbol) = @_;
    my $start = 0;
    my $try = 0;
	while ($len > 0){
	    if (substr($word, $start, 1) eq $symbol){
            substr($secreet_word, $start, 1) = $symbol;
            $try++;
        }
        else{
            # enter your code;    
        }
        $len--;
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

say "Приветствую тебя в игре \"угадай слово\"";
my $PlayAgain = "yes";
while ($PlayAgain eq "yes" or $PlayAgain eq "y"){
    my $word = WordsForGame;
    my $len = length($word);
    my $secreet_word = '*' x $len;
    printf "Я задумал слово %s \n", $secreet_word;
    my ($try, $next_try) = 0;
    my $symbol="";
    my $StatusOfGame = 1;
    say $word; # Test
    while ($StatusOfGame > 0) {
    	HangMan($try);
    	printf ("Можно ошибиться еще %d раз \n", 5 - $try);
    	say "Введите букву из этого слова на английском";
        chomp($symbol=lc <STDIN>);
        ($secreet_word, $next_try) = CheckChar($len, $secreet_word, 
        	$word, $symbol);
        $try = $try + $next_try;
        if ($try == 5){
        	HangMan($try);
        	say "Game Over";
        	last;
        }
        say "проверка";
        say $secreet_word;
        # Full word or no? / Проверка угадали ли слово целиком или нет
        if ($secreet_word eq $word){
        	say "Вы угадали слово, поздравляю.";
            $StatusOfGame = 0;
        }
    }

    say "Хотите играть y(es) или n(o)?";
    chomp($PlayAgain=lc<STDIN>);
}
