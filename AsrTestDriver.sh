#!/bin/bash

cd $(dirname $0)
CURRENT_DIR=`pwd`

export LD_LIBRARY_PATH=${CURRENT_DIR}/lib/:
export VRG_CLIENT_CA_PATH=/etc/pki/tls/certs/ca-bundle.crt
export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH

usage_exit() {
  echo "Usage: $0 [-u url] [-p port] [-d domain] [-k key] [-f file] [-m mode] [-l level] [-c] [-n]" 1>&2
  echo "  [-u url]     ... backend_url         (default:https://127.0.0.1/)" 1>&2
  echo "  [-p port]    ... backend_port        (default:443)" 1>&2
  echo "  [-d domain]  ... domain_id           (default:)" 1>&2
  echo "  [-d key]     ... api_key             (default:)" 1>&2
  echo "  [-l lang]    ... language ja/en/zh   (default:ja)" 1>&2
  echo "  [-f file]    ... audio file name     (default:./pcm/ja_short.pcm)" 1>&2
  echo "  [-r rate]    ... sampling_rate 8000 or 16000                    (default:16000)" 1>&2
  echo "  [-m mode]    ... vad_mode 0(off), 1(clientsize), 2(serverside)  (default:2)" 1>&2
  echo "  [-v verbose] ... log_level 0:none - 6:verbose                   (default:1)" 1>&2
  echo "  [-c]         ... continuous_mode" 1>&2
  echo "  [-h]         ... output usage" 1>&2
  exit 1
}

# parameter default value
BACKEND_URL=https://corevo-asr.xfarm.jp/ 
BACKEND_PORT=443
DOMAIN_ID=dGVzdC1kb21haW4=
API_KEY=l7xx1a95ebe9fddc4904a4edbdedf1c626dc

LANGUAGE=ja
INPUT_FILE=./record.wav
INPUT_RATE=16000
VAD_MODE=2
LOG_LEVEL=1
CONTINUOUS_MODE=0

while getopts u:p:d:k:l:f:r:m:v:ch OPT
do
  case $OPT in
    u)  BACKEND_URL=$OPTARG
        ;;
    p)  PBACKEND_PORT=$OPTARG
        ;;
    d)  DOMAIN_ID=$OPTARG
        ;;
    k)  API_KEY=$OPTARG
        ;;
    l)  LANGUAGE=$OPTARG
        ;;
    f)  INPUT_FILE=$OPTARG
        ;;
    r)  INPUT_RATE=$OPTARG
        ;;
    m)  VAD_MODE=$OPTARG
        ;;
    v)  LOG_LEVEL=$OPTARG
        ;;
    c)  CONTINUOUS_FLAG=1
        ;;
    h)  usage_exit
        ;;
    \?) usage_exit
        ;;
  esac
done

shift $((OPTIND - 1))

if [ "${BACKEND_URL}" = "" ];then
    echo "BACKEND_URL is empty"
    exit 1;
fi

if [ "${BACKEND_PORT}" = "" ];then
    echo "BACKEND_PORT is empty"
    exit 1;
fi

if [ "${DOMAIN_ID}" = "" ];then
    echo "DOMAIN_ID is empty"
    exit 1;
fi

if [ "${API_KEY}" = "" ];then
    echo "API_KEY is empty"
    exit 1;
fi

./AsrTestDriver $BACKEND_URL $BACKEND_PORT $DOMAIN_ID $API_KEY $VAD_MODE $CONTINUOUS_MODE $INPUT_RATE $INPUT_FILE $LANGUAGE $LOG_LEVEL

