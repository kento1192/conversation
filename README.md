
## conversation

* SpeechRec operation verification

### Setup procedure

* Install required packages
<pre>
# yum groupinstall -y "Development tools"
# yum install -y http://packages.groonga.org/centos/groonga-release-1.1.0-1.noarch.rpm
# yum install -y mecab mecab-devel mecab-ipadic alsa-utils
</pre>
* Installing OpenSSL 1.0.2
<pre>
# wget https://www.openssl.org/source/openssl-1.0.2j.tar.gz
# tar xzf openssl-1.0.2j.tar.gz
# cd openssl-1.0.2j
# ./config --prefix=/usr/local --openssldir=/usr/local/openssl shared
# make
# make install
</pre>
* Install python 2.7 environment and modules
<pre>
# yum install -y centos-release-scl-rh
# yum install -y python27
# scl enable python27 bash
# pip install numpy gensim sklearn mecab-python
</pre>

### How to use

1. Switching to Python 2.7 environment
<pre>
# scl enable python27 bash
</pre>
2. Program execution
<pre>
# ./speaker.sh
</pre>

### Rough Process flow

1. recording
2. Text recorded the recorded sound
3. Extract corresponding answer
4. Audio file creation
5. Play audio file

### Note
* Please grant execute permission to the file as necessary 
* Supported only with CentOS6.8
  * ※Not verified on other Linux OS
* The COREVO-API library is registered in ./libs:/usr/local/lib64
  * ※I am passing the path here at AsrTestDriver.sh
> export LD_LIBRARY_PATH=./libs:/usr/local/lib64

### Output file
* record.wav
  * Audio input from the microphone
* voice.txt
  * Text converted to sound input from microphone
* Question_Trust.txt
  * The extracted question contents
* decoding_sounds.wav
  * Audio file to respond to questions

