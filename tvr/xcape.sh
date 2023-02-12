#!/bin/sh

#XCape ==xcape -- reassign modifier keys etc.
#Control by itself gives emacspeak modifier.
# See forthcoming blog article for rationale.



TM=250 #timeout in ms for keyup

KEYS="\
Shift_R=Control_L|r;\
Shift_L=Control_L|s;\
Super_L=Control_L|c;\
Alt_L=Control_L|x;\
Alt_R=Control_L|x;\
Control_R=Control_L|e;\
Control_L=Control_L|e"
pidof xcape && kill -9 `pidof xcape`
xcape -t $TM -e  "$KEYS" 2>&1 > /dev/null &
