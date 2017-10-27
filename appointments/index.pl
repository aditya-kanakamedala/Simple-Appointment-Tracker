#!C:/strawberry/perl/bin/perl.exe

use strict;
use warnings;

use CGI;

use HTML::Template;

use JSON;

use DBI;
use Cwd;

use DBD::mysql;

my $cgi = CGI->new;
my $request_method = $cgi->request_method;
my %params = $cgi->Vars;

if ($request_method == 'GET') {
  ## no ajax parameters
  if (%params == 0) {
    ## render the front page
    my $template = HTML::Template->new(filename => 'templates\appointments.html');
    # $template->param(MSG => $msg);
    print "Content-type: text/html\n\n";
    print $template->output;
  }
  ## ajax request
  else {
    ## database call

    #my $db = "appointments";
    #my $user = "root";
    #my $pass = 'root';
    #my $host = "localhost";
    my $dir = getcwd;


    my %config = do $dir.'/db/db_credentials.pl';
  #  my $dbh = DBI->connect("DBI:mysql:$db:$host", $user, $pass, {RaiseError=>1}) or die $DBI::errstr;


    my $dbh = DBI->connect("DBI:mysql:database=".$config{db}.";host=".$config{host}."",$config{user}, $config{password}) or die $DBI::errstr;

    my $searchQuery = $params{q};
    my $query = "SELECT * FROM appointments WHERE Description LIKE ?";
    my $statement = $dbh->prepare($query);

    # execute your SQL statement
    $statement->execute('%'.$searchQuery.'%');
    my $tableRow;
    my $table;
    my $value;
    while(my $row = $statement->fetchrow_hashref()) {
      while((my $key, my $value) = each(%$row)) {
        $value =~ s/"/\\"/g;
        $tableRow .= "\"$key\":\"${value}\",";
      }
      $tableRow =~ s/,$//;
      $tableRow = "{${tableRow}},";
      $table .= $tableRow;
      $tableRow = "";
    }

    $table =~ s/,$//;
    my $result = '{"failure":"0", "result":['.$table.']}';

    print "Content-type: application/json\n\n";
    print $result;
  }
}
