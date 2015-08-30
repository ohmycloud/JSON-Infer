
use v6;

=begin pod

=head1 NAME

JSON::Infer::Role::Classes

=head1 DESCRIPTION

=head2 METHODS


=head3 classes

=head3 add_classes

This takes and object of this role and adds it's classes to my classes.

=end pod

role JSON::Infer::Role::Classes {

    need JSON::Infer::Class;

    has JSON::Infer::Class @.classes is rw;

    method  add-classes(Mu:D $object) {

        if $object.does($?ROLE) {
            for $object.classes --> $class {
                $!classes.push($class);
            }
        }

        if  $object.isa(JSON::Infer::Class) {
            $!classes.push($object);
        }
    }

}
# vim: expandtab shiftwidth=4 ft=perl6