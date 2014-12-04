echo $POPCLIP_TEXT | sed -E -n '/^[-+]/{
    s/^.[[:blank:]]*(\([^)]*\))?[[:blank:]]*//
    s/[[:blank:]]*[;{][[:blank:]]*$//
    s/:[^:]*([[:blank:]]|$)/:/g
    p
}'