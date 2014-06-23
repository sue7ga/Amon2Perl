package MyApp::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use Data::Dumper;

use MyApp::Model::Entry;

any '/' => sub {
   my ($c) = @_;
   my $entires = map{
      MyApp::Model::Entry->new($_)
   }@{$c->dbh->selectall_arrayref(q[
          SELECT * FROM entries ORDER BY id DESC
   ],{Slice => {}})};
   print Dumper $entires;
};

post '/reset_counter' => sub {
    my $c = shift;
    $c->session->remove('counter');
    return $c->redirect('/');
};

post '/account/logout' => sub {
    my ($c) = @_;
    $c->session->expire();
    return $c->redirect('/');
};

1;
