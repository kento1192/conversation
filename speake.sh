#!/bin/bash

echo "録音を開始します"

arecord -r 16000 -d 3 -f S16_LE -D plughw:0,0 record.wav

echo "音声データをテキストデータに変換します"

time ./AsrTestDriver.sh | grep surface | awk '{print $2}' | sed -e 's/"//g' > voice.txt

echo "音声の入力結果を出力します。"
echo voice.txt=$(cat voice.txt)

echo "質問内容を抽出しています"
echo "質問内容の推測結果を出力します"

python demo2.py testTrain.txt testLableList.txt $(cat voice.txt)
echo "質問内容に対応した音声データを作成します"

python demo2.py testTrain.txt testLableList.txt $(cat voice.txt) | awk '{print $3}' > Question_Trust.txt
Voice_txt=$(cat Question_Trust.txt)

case "$Voice_txt" in
  
 *始業時刻* ) sed -e s/input_voice/午前９時から営業しています。/g send_txt.sh.tem > send_txt.sh
  ./send_txt.sh ;;

 *終業時刻* ) sed -e s/input_voice/午後９時まで営業しています。/g send_txt.sh.tem > send_txt.sh
  ./send_txt.sh ;;


 *受付* ) sed -e s/input_voice/受付は階段を上ってすぐ右です。/g send_txt.sh.tem > send_txt.sh
  ./send_txt.sh ;;

 *最寄駅* ) sed -e s/input_voice/最寄駅は東京です。/g send_txt.sh.tem > send_txt.sh  
 ./send_txt.sh ;;

 *トイレ* ) sed -e s/input_voice/１階右奥です。/g send_txt.sh.tem > send_txt.sh
  ./send_txt.sh ;;

 * ) sed -e s/input_voice/申し訳ありません、勉強してきます/g send_txt.sh.tem > send_txt.sh
  ./send_txt.sh ;;

esac



