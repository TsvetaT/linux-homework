#!/bin/sh

FILE=$1;
cat $FILE | sed -r "s/(.+)=(.+)/\1/g" > /tmp/names;
cat $FILE | sed -r "s/(.+)=(.+)/echo $\1/g" > /tmp/vars;
cat $FILE /tmp/vars | bash > /tmp/values;

ind=1;
for var in `cat /tmp/names`;
do
    creativeName=`head -$ind /tmp/values | tail -1`;
    sed -i -r "s/@$var@/$creativeName/g" sample.txt;
    ind=$(($ind+1));
done

echo "THE FILE HAS BEEN ALTERED SUCCESSFULLY!\n\n";
cat sample.txt;
