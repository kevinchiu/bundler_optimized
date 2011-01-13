#!/bin/bash
#
# ToSift.sh
# Create a script for extracting sift features from a set of images

# Set this variable to your base install path (e.g., /home/foo/bundler)
BIN_PATH=$(dirname $(which $0));

IMAGE_DIR="."

if [ $# -eq 1 ]
then
    IMAGE_DIR=$1
fi

OS=`uname -o`

if [ $OS == "Cygwin" ]
then
    SIFT=$BIN_PATH/siftWin32.exe
else
    SIFT=$BIN_PATH/sift
fi

if [ -e $SIFT ]
then 
:
else
    echo "[ToSift] Error: SIFT not found.  Please install SIFT to $BIN_PATH" > /dev/stderr
fi

for d in `ls -1 $IMAGE_DIR | egrep "jpg$"`
  do 
    pgm_file=$IMAGE_DIR/`echo $d | sed 's/jpg$/pgm/'`
    key_file=$IMAGE_DIR/`echo $d | sed 's/jpg$/key/'`
    echo "mogrify -format pgm $IMAGE_DIR/$d; $SIFT < $pgm_file > $key_file; rm $pgm_file; gzip -f $key_file"
    #echo "wc -l $key_file.vlfeat | awk '{ print \$1 \" 128\" }' > $key_file"
    #echo "awk 'BEGIN { split(\"4 24 44 64 84 104 124 132\", offsets); } { i1 = 0; tmp = \$1; \$1 = \$2; \$2 = tmp; for (i=1; i<9; i++) { 12 = offsets[i]; out = \"\"; for (j=i1+1; j<=i2; j++) {  if (j != i1+1) { out = out \" \" echo "rm $key_file.vlfeat"
    #echo "gzip -f $key_file"
  done
