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
����[ zg_file_filter.sh �RMO�0=׿�a"���ހp*a�jO!�i��Ǝl����;6�~�H���ߛyo&��\�d^؆��'
U��\#`�V�':��\��>�0��)�M�Iy��R"��4�h�,���t�x�q-gli�Gq|�����2���a�AH��6Ȣa���)��5t�v$)\�����tR+����F���g���x��Gm��y�[�ٲF��O���uu!��~{S��t8c�$�A9^~���jI��"����pf��k��A�}��A��C���=R�����6=Iot���%�S|���o��=��i�B��F=	'��g/gW�%L�G��8Ҕ�[�8m��h/��������i�q��`��#�R�� ���s�JA?��|o�*ȹ"�j�ɶ��*e������'�M�i?�>���D?��V���[�?Z�Ww  