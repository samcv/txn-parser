use v6;
unit module X::TXN::Parser;

# X::TXN::Parser::Entry::MultipleEntities {{{

class Entry::MultipleEntities is Exception
{
    has Str:D $.entry-text is required;
    has UInt:D $.number-entities is required;

    method message() returns Str:D
    {
        qq:to/EOF/.trim;
        Sorry, only one entity per ledger entry allowed, but found
        $.number-entities entities.

        In entry:

        「$.entry-text」
        EOF
    }
}

# end X::TXN::Parser::Entry::MultipleEntities }}}

# X::TXN::Parser::Include {{{

class Include is Exception
{
    has Str:D $.filename is required;

    method message() returns Str:D
    {
        qq:to/EOF/.trim;
        Sorry, could not load accounting ledger to include at

            「$.filename」

        Accounting ledger not found or not readable.
        EOF
    }
}

# end X::TXN::Parser::Include }}}

# X::TXN::Parser::ParseFailed {{{

class ParseFailed is Exception
{
    has Str:D $.content is required;
    method message() returns Str:D
    {
        "Invalid TXN:\n「$.content」";
    }
}

# end X::TXN::Parser::ParseFailed }}}

# X::TXN::Parser::ParsefileFailed {{{

class ParsefileFailed is Exception
{
    has Str:D $.file is required;
    method message() returns Str:D
    {
        "Invalid TXN in file 「$.file」";
    }
}

# end X::TXN::Parser::ParsefileFailed }}}

# X::TXN::Parser::String::EscapeSequence {{{

class String::EscapeSequence is Exception
{
    has Str:D $.esc is required;

    method message() returns Str:D
    {
        "Sorry, found bad string escape sequence 「$.esc」";
    }
}

# end X::TXN::Parser::String::EscapeSequence }}}

# X::TXN::Parser::TXNLibAbsolute {{{

class TXNLibAbsolute is Exception
{
    has Str:D $.lib is required;

    method message() returns Str:D
    {
        "Sorry, txnlib path can't be absolute. Got:「$.lib」";
    }
}

# end X::TXN::Parser::TXNLibAbsolute }}}

# vim: set filetype=perl6 foldmethod=marker foldlevel=0:
