#! /bin/sh

DEST=artifacts/$MINGW_CHOST"_test"

rm -rf references
mkdir references

test-materials/ffmpeg.exe -i test-materials/battleThemeA.mp3 references/BattleThemeA.wav > /dev/null 2>&1

echo "Step 1. Generating reference PCM files"
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p2_44_128.aac -f s16le references/battleThemeA_p2_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p5_44_128.aac -f s16le references/battleThemeA_p5_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p23_44_128.aac -f s16le references/battleThemeA_p23_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p29_44_128.aac -f s16le references/battleThemeA_p29_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p39_44_128.aac -f s16le references/battleThemeA_p39_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p2_44_256.aac -f s16le references/battleThemeA_p2_44_256.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p2_44_m1.aac -f s16le references/battleThemeA_p2_44_m1.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i test-materials/BattleThemeA_p2_44_m5.aac -f s16le references/battleThemeA_p2_44_m5.pcm > /dev/null 2>&1


rm -rf $DEST
mkdir $DEST

# Execute using built binary.
echo "Step 2. Generating test AAC files using fdkaac.exe with libfdk-aac-2.dll"

artifacts/$MINGW_CHOST/fdkaac.exe -S -p 2 -b 128 -o $DEST/BattleThemeA_p2_44_128.aac references/BattleThemeA.wav
artifacts/$MINGW_CHOST/fdkaac.exe -S -p 5 -b 128 -o $DEST/BattleThemeA_p5_44_128.aac references/BattleThemeA.wav
artifacts/$MINGW_CHOST/fdkaac.exe -S -p 23 -b 128 -o $DEST/BattleThemeA_p23_44_128.aac references/BattleThemeA.wav
artifacts/$MINGW_CHOST/fdkaac.exe -S -p 29 -b 128 -o $DEST/BattleThemeA_p29_44_128.aac references/BattleThemeA.wav
artifacts/$MINGW_CHOST/fdkaac.exe -S -p 39 -b 128 -o $DEST/BattleThemeA_p39_44_128.aac references/BattleThemeA.wav
artifacts/$MINGW_CHOST/fdkaac.exe -S -p 2 -b 256 -o $DEST/BattleThemeA_p2_44_256.aac references/BattleThemeA.wav
artifacts/$MINGW_CHOST/fdkaac.exe -S -p 2 -m 1 -o $DEST/BattleThemeA_p2_44_m1.aac references/BattleThemeA.wav
artifacts/$MINGW_CHOST/fdkaac.exe -S -p 2 -m 5 -o $DEST/BattleThemeA_p2_44_m5.aac references/BattleThemeA.wav


# Make raw pcm from encoded files.
echo "Step 3. Generating test PCM files"

test-materials/ffmpeg.exe -i $DEST/BattleThemeA_p2_44_128.aac -f s16le $DEST/battleThemeA_p2_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i $DEST/BattleThemeA_p5_44_128.aac -f s16le $DEST/BattleThemeA_p5_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i $DEST/BattleThemeA_p23_44_128.aac -f s16le $DEST/BattleThemeA_p23_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i $DEST/BattleThemeA_p29_44_128.aac -f s16le $DEST/BattleThemeA_p29_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i $DEST/BattleThemeA_p39_44_128.aac -f s16le $DEST/BattleThemeA_p39_44_128.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i $DEST/BattleThemeA_p2_44_256.aac -f s16le $DEST/BattleThemeA_p2_44_256.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i $DEST/BattleThemeA_p2_44_m1.aac -f s16le $DEST/BattleThemeA_p2_44_m1.pcm > /dev/null 2>&1
test-materials/ffmpeg.exe -i $DEST/BattleThemeA_p2_44_m5.aac -f s16le $DEST/BattleThemeA_p2_44_m5.pcm > /dev/null 2>&1


# Compare raw pcm files.
echo "Step 4. Comparing PCM files"

cmp references/battleThemeA_p2_44_128.pcm $DEST/battleThemeA_p2_44_128.pcm
cmp references/BattleThemeA_p5_44_128.pcm $DEST/BattleThemeA_p5_44_128.pcm
cmp references/BattleThemeA_p23_44_128.pcm $DEST/BattleThemeA_p23_44_128.pcm
cmp references/BattleThemeA_p29_44_128.pcm $DEST/BattleThemeA_p29_44_128.pcm
cmp references/BattleThemeA_p39_44_128.pcm $DEST/BattleThemeA_p39_44_128.pcm
cmp references/BattleThemeA_p2_44_256.pcm $DEST/BattleThemeA_p2_44_256.pcm
cmp references/BattleThemeA_p2_44_m1.pcm $DEST/BattleThemeA_p2_44_m1.pcm
cmp references/BattleThemeA_p2_44_m5.pcm $DEST/BattleThemeA_p2_44_m5.pcm

echo "====Test finished===="
