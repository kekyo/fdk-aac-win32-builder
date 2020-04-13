#! /bin/sh

rm -rf artifacts
rm -rf stage

mkdir artifacts
mkdir stage

cd artifacts

wget https://jaist.dl.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-0.1.6.tar.gz
wget https://jaist.dl.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-2.0.1.tar.gz
wget https://github.com/nu774/fdkaac/archive/1.0.0.tar.gz

mv 1.0.0.tar.gz fdkaac-1.0.0.tar.gz

cd ..

rm -rf references
mkdir references

test-materials/ffmpeg.exe -i test-materials/battleThemeA.mp3 references/BattleThemeA.wav > /dev/null 2>&1

test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p2_44_128.aac -f s16le references/battleThemeA_p2_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p5_44_128.aac -f s16le references/battleThemeA_p5_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p23_44_128.aac -f s16le references/battleThemeA_p23_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p29_44_128.aac -f s16le references/battleThemeA_p29_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p39_44_128.aac -f s16le references/battleThemeA_p39_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p2_44_256.aac -f s16le references/battleThemeA_p2_44_256.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p2_44_m1.aac -f s16le references/battleThemeA_p2_44_m1.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p2_44_m5.aac -f s16le references/battleThemeA_p2_44_m5.pcm > /dev/null 2>&1
