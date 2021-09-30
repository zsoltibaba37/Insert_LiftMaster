#!/bin/bash


if [ -z $1 ] || [ $1 == '-h' ] || [ $1 == '-help' ]
then
    echo ""
    echo "Usage:
     >  INS_LM.sh <filename>"
    echo ""
    exit 0
fi

if [ ! -f "$1" ]
then
    echo ""
    echo "Missing filename or Unknow command ! ! !"
    echo ""
    echo "Usage:
     >  INS_LM.sh <filename>"
    echo ""
    exit 0
fi

data="C\nBEGIN_SHEET_LOAD_DATA\nC\nZA,MM,21\nMM,AT,1,  10,1,1,,'Load Name'                             ,,'',T\nMM,AT,1,  30,1,1,,'Double Sheet Detection Active'         ,,'Bool',Z\nMM,AT,1,  60,1,1,,'Sheet Alignment Active'                ,,'Bool',Z\nMM,AT,1,  80,1,1,,'Peeling Type'                          ,,'',Z\nMM,AT,1, 110,1,1,,'Suction Cup Configuration 1'           ,,'',T\nMM,AT,1, 120,1,1,,'Suction Cup Configuration 2'           ,,'',T\nMM,AT,1, 130,1,1,,'Suction Cup Configuration 3'           ,,'',T\nMM,AT,1, 140,1,1,,'Suction Cup Configuration 4'           ,,'',T\nMM,AT,1, 230,1,1,,'Loading Type'                          ,,'',Z\nMM,AT,1, 240,1,1,,'TransportMode'                         ,,'',Z\nMM,AT,1, 260,1,1,,'Suction Cup Group 1'                   ,,'',Z\nMM,AT,1, 270,1,1,,'Suction Cup Group 2'                   ,,'',Z\nMM,AT,1, 280,1,1,,'Suction Cup Group 3'                   ,,'',Z\nMM,AT,1, 290,1,1,,'Suction Cup Group 4'                   ,,'',Z\nMM,AT,1, 300,1,1,,'Suction Cup Selection Type'            ,,'',Z\nMM,AT,1, 310,1,1,,'Suction Cup Configuration 5'           ,,'',T\nMM,AT,1, 320,1,1,,'Suction Cup Configuration 6'           ,,'',T\nMM,AT,1, 330,1,1,,'Suction Cup Configuration 7'           ,,'',T\nMM,AT,1, 340,1,1,,'Suction Cup Configuration 8'           ,,'',T\nMM,AT,1, 350,1,1,,'Spreizmagnet (Lift)'                   ,,'Bool',Z\nMM,AT,1, 360,1,1,,'Drehzylinder (Lift)'                   ,,'Bool',Z\nC\nZA,DA,1\nDA,'SHL-1',1,0,1,'0003FFFF','00000000','00000000','00000000',7,0,1,1,\n*  1,1,1,'00000000','00000000','00000000','00000000',1,1\nC\nENDE_SHEET_LOAD_DATA"


# change 100th line
sed -i "s/DA,'SHL-1',1,1,1,1,1,50.00,50.00,1/DA,'SHL-1',7,1,1,1,1,50.00,50.00,1/g" $1 &&

# insert data to 104th line
sed -i "104i\\$data" $1 &&

unix2dos $1 > /dev/null 2>&1 &&

echo ""
echo "$1 file has been modified."

