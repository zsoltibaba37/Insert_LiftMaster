# Insert_LiftMaster
---
- What is this script? -> This little script maybe just working for me.
- What does the script do? -> Inserted a few line to LST file. (NC file)
- What is LiftMaster? -> LiftMaster is a sheet metal loader beside the Trumpf laser cutting machine.
---
### What is LST file?
- TruTops NC file
---
### How i will use it 
```sh
> cp2bin ins_lm.sh
> The ins_lm.sh file has been copied to a /usr/local/bin/ folder
>
>
> cd <working folder>
> ls
> 11314264_B.LST 11314264_C.LST 11314264_D.LST
>
> find . -maxdepth 1 -type f -name "*.LST" -exec ins_lm.sh {} \;
>
> The '11314264_B_LiftMaster.LST' file has been created.
>
> The '11314264_C_LiftMaster.LST' file has been created.
>
> The '11314264_D_LiftMaster.LST' file has been created.
```
---
### Help
```
-h, -help         Usage:                      
                  >  ins_lm.sh [filename]
```


2021-10-01
