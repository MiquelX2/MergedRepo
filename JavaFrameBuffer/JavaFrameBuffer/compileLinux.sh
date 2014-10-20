#!/bin/sh

jniResult=libFrameBufferJNI.so

jniJdkHeader=/usr/lib/jvm/java-7-oracle/include
jniSysHeader=/usr/lib/jvm/java-7-oracle/include/linux

rm "$jniResult" 2>/dev/null

echo "javah"
javah -d src/main/c  -classpath bin org.tw.pi.framebuffer.FrameBuffer
rm src/main/c/org_tw_pi_framebuffer_FrameBuffer_ScreenPanel.h
rm src/main/c/org_tw_pi_framebuffer_FrameBuffer_UpdateThread.h


echo "gcc"
gcc -Wall -O2 -o "$jniResult" -shared -I "$jniJdkHeader"  -I "$jniSysHeader" -I src/main/c src/main/c/FrameBuffer.c -fPIC

echo
ls -l "$jniResult"
echo "done"

