#!C:/strawberry/perl/bin/perl.exe

use strict;
use warnings;

use CGI;

use HTML::Template;

use DBI;
use DBD::mysql;


## use CGI::Carp qw(fatalsToBrowser);
my $cgi = CGI->new;

my $date = $cgi->param('date');
my $time = $cgi->param('time');
my $desc = $cgi->param('desc');

my $query = "INSERT INTO appointments(Date, Time, Description) values(?, ?, ?)";

my %config = do '../db/db_credentials.pl';

my $dbh = DBI->connect("DBI:mysql:database=".$config{db}.";host=".$config{host}."",$config{user}, $config{password}) or die $DBI::errstr;

my $statement = $dbh->prepare($query);

# execute your SQL statement
$statement->execute($date, $time, $desc);

$statement->finish();

my $referer = $cgi->referer;

print $cgi->header(-location => $referer);

exit;
