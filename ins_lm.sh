#!/bin/bash
# This little script maybe just working for me.
# Inserted a few line to LST file. (NC file)
# LiftMaster is a sheet metal loader beside the Trumpf laser cutting machine.
# 
# 2021-10-01 Zsolti

# checking the $1 argument is empty or -h, -help
if [ -z $1 ] || [ $1 == '-h' ] || [ $1 == '-help' ]
then
    echo ""
    echo "Usage:
     >  ins_lm.sh [filename]"
    echo ""
    exit 0
fi

# checks to see if the file is available
if [ ! -f "$1" ]
then
    echo ""
    echo "Missing the file or Unknown command ! ! !"
    echo ""
    echo "Usage:
     >  ins_lm.sh [filename]"
    echo ""
    exit 1
fi

# checking file extension
filename=$1
filext=$(echo $filename | cut -d '.' -f2) &&

if [ $filext != 'LST' ]
then
    echo ""
    echo "This not LST file."
    echo ""
    exit 1
fi

# file name - before the filename dot
filename_=$(echo $filename | cut -d '.' -f1) &&

# the new file ending part
_filename='_LiftMaster.LST'
newfilename="$filename_$_filename"

# copy file
cp -p $filename $newfilename &&

data="C\nBEGIN_SHEET_LOAD_DATA\nC\nZA,MM,21\nMM,AT,1,  10,1,1,,'Load Name'                             ,,'',T\nMM,AT,1,  30,1,1,,'Double Sheet Detection Active'         ,,'Bool',Z\nMM,AT,1,  60,1,1,,'Sheet Alignment Active'                ,,'Bool',Z\nMM,AT,1,  80,1,1,,'Peeling Type'                          ,,'',Z\nMM,AT,1, 110,1,1,,'Suction Cup Configuration 1'           ,,'',T\nMM,AT,1, 120,1,1,,'Suction Cup Configuration 2'           ,,'',T\nMM,AT,1, 130,1,1,,'Suction Cup Configuration 3'           ,,'',T\nMM,AT,1, 140,1,1,,'Suction Cup Configuration 4'           ,,'',T\nMM,AT,1, 230,1,1,,'Loading Type'                          ,,'',Z\nMM,AT,1, 240,1,1,,'TransportMode'                         ,,'',Z\nMM,AT,1, 260,1,1,,'Suction Cup Group 1'                   ,,'',Z\nMM,AT,1, 270,1,1,,'Suction Cup Group 2'                   ,,'',Z\nMM,AT,1, 280,1,1,,'Suction Cup Group 3'                   ,,'',Z\nMM,AT,1, 290,1,1,,'Suction Cup Group 4'                   ,,'',Z\nMM,AT,1, 300,1,1,,'Suction Cup Selection Type'            ,,'',Z\nMM,AT,1, 310,1,1,,'Suction Cup Configuration 5'           ,,'',T\nMM,AT,1, 320,1,1,,'Suction Cup Configuration 6'           ,,'',T\nMM,AT,1, 330,1,1,,'Suction Cup Configuration 7'           ,,'',T\nMM,AT,1, 340,1,1,,'Suction Cup Configuration 8'           ,,'',T\nMM,AT,1, 350,1,1,,'Spreizmagnet (Lift)'                   ,,'Bool',Z\nMM,AT,1, 360,1,1,,'Drehzylinder (Lift)'                   ,,'Bool',Z\nC\nZA,DA,1\nDA,'SHL-1',1,0,1,'0003FFFF','00000000','00000000','00000000',7,0,1,1,\n*  1,1,1,'00000000','00000000','00000000','00000000',1,1\nC\nENDE_SHEET_LOAD_DATA"


################################################################################
# change 101th line
sed -i "s/DA,'SHL-1',1,1,1,1,1,50.00,50.00,1/DA,'SHL-1',7,1,1,1,1,50.00,50.00,1/g" $newfilename &&

# insert data to 104th line
sed -i "104i\\$data" $newfilename &&

# Replace old filename inside new file
#sed -i -e "s/$filename/$newfilename/g" $newfilename

# restore the original type Latin-1
unix2dos $newfilename > /dev/null 2>&1 &&

echo ""
echo "The '$newfilename' file has been created."
echo ""
