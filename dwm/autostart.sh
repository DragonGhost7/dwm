#!/bin/bash

pidof -x spotifup >/dev/null 2>&1 || spotifup &
pidof -x mpdup >/dev/null 2>&1 || mpdup >/dev/null 2>&1 &
#its literally just checking when spotify music changes
