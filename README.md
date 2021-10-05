## Insert_LiftMaster

What is this script? -> This little script maybe just working for me.

What does the script do? -> Inserted a few line to LST file. (NC file)

What is LiftMaster? -> LiftMaster is a sheet metal loader beside the Trumpf laser cutting machine.

### What is LST file?

TruTops NC file

### How i will use it

```sh
> cp2bin ins_lm.sh
> cp2bin find_lst.sh
> cp2bin find_all.sh
```

If the files are in this directory 
```sh
> ls
> 11314264_B.LST 11314264_C.LST 11314264_D.LST
```
Use this script
`> find_lst.sh`

If the files are in subdirectories
```sh
> ls folder1 folder1 folder3
```
Use this script
`> find_all.sh`

Output
```sh
>
> The '11314264_B_LiftMaster.LST' file has been created.
>
> The '11314264_C_LiftMaster.LST' file has been created.
>
> The '11314264_D_LiftMaster.LST' file has been created.
```

### Help

```
-h, -help         Usage:                      
                  >  ins_lm.sh [filename]
```

<p align="center">2021-10-01</p>
