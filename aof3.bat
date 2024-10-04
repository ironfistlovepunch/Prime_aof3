REM P ROM
romcutter p1.bin 096-p2.sp2 100000 200000

REM 096-p1.p1 0x115 02 => 00
romcutter p1.bin data00 2 1
romcutter p1.bin prom1 0 115
romcutter p1.bin prom2 116 FFEEA

copy /b /y prom1+data00+prom2 096-p1.p1
del prom1,prom2,data00

REM M ROM
copy m1.bin 096-m1.m1
copy /b 096-m1.m1+

REM S ROM
copy s2.bin 096-s1.s1
copy /b 096-s1.s1+

REM V ROM
romcutter v1.bin 096-v1.v1 0 200000
romcutter v1.bin 096-v2.v2 200000 200000
romcutter v1.bin 096-v3.v3 400000 200000

REM C ROM
(
echo 0
echo 0
echo 400000
echo 096-c1.c1
echo 0
echo 1
echo 400000
echo 096-c2.c2
echo 400000
echo 0
echo 400000
echo 096-c3.c3
echo 400000
echo 1
echo 400000
echo 096-c4.c4
echo 800000
echo 0
echo 400000
echo 096-c5.c5
echo 800000
echo 1
echo 400000
echo 096-c6.c6
echo C00000
echo 0
echo 200000
echo 096-c7.c7
echo C00000
echo 1
echo 200000
echo 096-c8.c8
echo -1
)|tiles2crom.exe c1.bin
