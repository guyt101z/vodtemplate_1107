#!bin/bash
	for fl in *.jsp; do
	mv $fl $fl.old
	sed 's/vodtemplate/vodtemplate_V1107/g' $fl.old > $fl
	rm -f $fl.old
	done
