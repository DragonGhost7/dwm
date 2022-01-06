#!/bin/sh

export IDENTIFIER="unicode"
# A dwm_bar function to display the number of emails in an inbox
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# To count mail in an inbox, change "/path/to/inbox" below to the location of your inbox. For example, "/home/$USER/.mail/new"

dwm_mail () {
    MAILBOX=$(find  ~/.mail/*/[Ii][Nn][Bb][Oo][Xx]/new/* -type f | wc -l 2>/dev/null)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$MAILBOX" -eq 0 ]; then
            printf "📪 %s" "$MAILBOX"
        else
            printf "📫 %s" "$MAILBOX"
        fi
    else
        printf "MAI %s" "$MAILBOX"
    fi
    printf "%s\n" "$SEP2"
}

dwm_mail
