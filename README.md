# Insert_LiftMaster
---
- Copies the original file and insert the LiftMaster section.
---
### What is LST file?
- TruTops NC file
---
### How i will use it 
```sh
> cp2bin INS_LM.sh
> The INS_LM.sh file has been copied to a /usr/local/bin/ folder
>
>
> cd <working folder>
> ls
> 11314264_B.LST 11314264_C.LST 11314264_D.LST
>
> find . -maxdepth 1 -type f -name "*.LST" -exec INS_LM.sh {} \;
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
                  >  INS_LM.sh [filename]
```


2021-10-01
