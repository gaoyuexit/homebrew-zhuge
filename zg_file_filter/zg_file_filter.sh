#!/bin/sh -
# compressed by gzexe
lines=19
prog=`/usr/bin/basename "$0"`
tmp=`/usr/bin/mktemp -d /tmp/gzexeXXXXXXXXXX` || {
/bin/echo "$prog: cannot create tmp dir"; exit 1
}
trap '/bin/rm -rf "$tmp"' 0
if /usr/bin/tail +$lines "$0" |
    /usr/bin/gzip -dc > "$tmp/$prog" 2> /dev/null; then
/bin/chmod u+x "$tmp/$prog"
"$tmp/$prog" ${1+"$@"}
ret=$?
else
/bin/echo "$prog: cannot decompress $0"
ret=1
fi
exit $ret
�w��[ zg_file_filter.sh �S�n�0<g�b	�C�Bz�K%�S�@�Ƃ�Ql���޵y*���؞��ݍ�5o�so���b%Fy�1[2�P�e�1}E�(q&TJ˘�`BwC^���$�����"���2�P��4`D\i�d�ʚ�o�����������-��b Ū�3,"�Ҏґ%�!�f� �t���`���v�Ű����}p�H895��ոy$=�ON����>*o
c��"�{ A��y�ζx�m���<'D5ic����(۞S�������w��w�4:��	9����9w�����i:}�O�l�@�q\#��p�2Q�Ը�p�l�
��۽^��d��+��ۙ]U
�M�3�[絆*(����q{�����t���W��}�-�o�ʽ~��=����Y��%5�K  