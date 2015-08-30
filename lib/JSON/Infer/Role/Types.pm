
use v6;

=begin pod

=head1 NAME

JSON::Infer::Role::Types

=head1 DESCRIPTION

=head2 METHODS


=head3 types

=head3 add-types

This takes and object of this role and adds it's types to my types.

=end pod

role JSON::Infer::Role::Types {

   need JSON::Infer::Types;

   has JSON::Infer::Types @.types is rw;


   method  add-types(Mu:D $object ) {

      if $object.does($?ROLE) {
         for $object.types -> $type {
            $!types.push($type);
         }
      }
      if $object.isa(JSON::Infer::Type) {
         $!types.push($type);
      }
   }
}
# vim: expandtab shiftwidth=4 ft=perl6