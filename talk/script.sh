#!/bin/bash

##################################################################################
# kubectl-season                                                                 #
#                                                                                #
# Welcome in Season plugin for kubectl Kubernetes CLI                            #
# which display randomly a seasonal emoji in the beginning of the resources name #
#                                                                                #
# Usage:                                                                         #
# ./kubectl-season <resource_type>                                               #
#                                                                                #
# Example:                                                                       #
# ./kubectl-season pod                                                           #
# NAME                        READY   STATUS    RESTARTS   AGE                   #
# 🎃 httpbin-c9cb9cbf6-r2gnc     1/1     Running   0          2d1h               #
# 🎃 my-nginx-75897978cd-f28j9   1/1     Running   0          2d20h              #
# 🎃 my-nginx-75897978cd-pt2dx   1/1     Running   0          43h                #
# 🎃 my-nginx-75897978cd-w2bcg   1/1     Running   0          42h                #
# 🎃 traefik-85854f965f-pb6j2    1/1     Running   1          137m               #
##################################################################################

# CONSTS
## Select emoji randomly
# FALL_EMOJIS=(🍂 🍊 🌰 🥮 🥧 ☕ 🎃)
# HALLOWEEN_EMOJIS=(🎃 👻 🧟 🧛 🕷 🧙 💀 ☠ 😈)
# XMAS_EMOJIS=(🎄 🎁 🎅 🦌 🍪 ☃️ ❄️ 🌟 🤶)
# WINTER_EMOJIS=(🥶 🥨 🏂 🌲 ❄️ ☃️ 🎿 🧤 ☔)
# EASTER_EMOJIS=(🐇 🐣 🍫 🥚 🔔 🧺 🌼 🐝)
# SUMMER_EMOJIS=(😎 🏄 🏊 🌴 🍹 ☀️ 👕 🥵)

NOW=`date +%m`

case $NOW in

  01|02|03)
    EMOJIS=(🥶 🥨 🏂 🌲 ❄️ ☃️ 🎿 🧤 ☔)
    ;;

  04|05)
    EMOJIS=(🐇 🐣 🍫 🥚 🔔 🧺 🌼 🐝)
    ;;

  06|07|08)
    EMOJIS=(😎 🏄 🏊 🌴 🍹 ☀️ 👕 🥵)
    ;;

  09)
    EMOJIS=(🎒 🖋️ 🚌 🏫 📚 👨‍🎓 ✂️ 📐)
    ;;

  10)
    EMOJIS=(🎃 👻 🧟 🧛 🕷 🧙 💀 ☠ 😈)
    ;;

  11)
    EMOJIS=(🍂 🍊 🌰 🥮 🥧 ☕ 🎃)
    ;;

  12)
    EMOJIS=(🎄 🎁 🎅 🦌 🍪 ☃️ ❄️ 🌟 🤶)
    ;;

esac

SELECTED_EMOJI=${EMOJIS[$(( ( RANDOM % ${#EMOJIS[@]} ) ))]};

## Usage
n=$'\n'
usage="Display seasonal emoji randomly just before resources name.${n}${n}Usage:${n}   kubectl season KIND${n}${n}Examples:${n}   kubectl season pod${n}   kubectl season pod,svc${n}   kubectl season deploy -A"

# MAIN
# Usage
if [[ "$1" == "" || "$1" == "-h" || "$1" == "--help" ]]
then
    echo "$usage" 
    exit 1
fi

# add an emoji at the beginning of the line except for blank line and line beginning by NAME
kubectl get "$@" | sed -E "/^(NAME|$)/ ! s/^/${SELECTED_EMOJI} /" | sed -E "s/(NAME)/   NAME/"
