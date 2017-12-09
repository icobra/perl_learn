#!/usr/bin/perl
use v5.20;
use warnings;

sub DispalyIntro{
    my $introMessage = <<"END" ;
Вы находитесь в земле, полной драконов. Вы видите
две пещеры. В одной пещере дракон дружелюбен
и поделится с вами своим сокровищем. Другой дракон
жаден и голоден, и съест вас сразу.
...
END
    print $introMessage;
}

my $cave = 0;

sub ChooseCave{
    while ($cave != 1 and $cave != 2){
        say "В какую пещеру пойдем? 1 или 2?";
        chomp($cave=<STDIN>);
    }
    return $cave
}

sub ChekCave{
    say "Подходим к пещере...";
    sleep(2);
    say "Темно и жутко...";
    sleep(2);
    say "Большой дракон выпрыгивает перед вами. Он открывает свою пасть...";
    say "";
    sleep(2);
    my $FriendliCave =int(rand(2)+1);
    
    if ($FriendliCave == $cave){
        say "И даёт тебе сокровище!";
    }else{
        say "Съедает вас за один раз!";
    }

}

my $PlayAgain = "yes";
while ($PlayAgain eq "yes" or $PlayAgain eq "y"){
    DispalyIntro;
    $cave = ChooseCave();
    ChekCave($cave);

    say "Хотите играть снова yes или no?";
    chomp($PlayAgain=<STDIN>);
}
