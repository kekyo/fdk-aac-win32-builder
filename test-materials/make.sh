#! /bin/sh

./ffmpeg.exe -i BattleThemeA.mp3 BattleThemeA.wav > /dev/null 2>&1

../artifacts/x86_64-w64-mingw32/fdkaac.exe -p 2 -b 128 -o BattleThemeA_p2_44_128.aac BattleThemeA.wav
../artifacts/x86_64-w64-mingw32/fdkaac.exe -p 5 -b 128 -o BattleThemeA_p5_44_128.aac BattleThemeA.wav
../artifacts/x86_64-w64-mingw32/fdkaac.exe -p 23 -b 128 -o BattleThemeA_p23_44_128.aac BattleThemeA.wav
../artifacts/x86_64-w64-mingw32/fdkaac.exe -p 29 -b 128 -o BattleThemeA_p29_44_128.aac BattleThemeA.wav
../artifacts/x86_64-w64-mingw32/fdkaac.exe -p 39 -b 128 -o BattleThemeA_p39_44_128.aac BattleThemeA.wav
../artifacts/x86_64-w64-mingw32/fdkaac.exe -p 2 -b 256 -o BattleThemeA_p2_44_256.aac BattleThemeA.wav
../artifacts/x86_64-w64-mingw32/fdkaac.exe -p 2 -m 1 -o BattleThemeA_p2_44_m1.aac BattleThemeA.wav
../artifacts/x86_64-w64-mingw32/fdkaac.exe -p 2 -m 5 -o BattleThemeA_p2_44_m5.aac BattleThemeA.wav

rm BattleThemeA.wav
