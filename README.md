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
# pip install numpy gh1.  conversation
</pre>

### How to use

1. Switching to Python 2.7 environment
<pre>
* scl enable python27 bash
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

* Three COREVO-API libraries are registered with conversation/libs/
** ※AsrTestDriver.shでここにパスを通してる
> export LD_LIBRARY_PATH=${CURRENT_DIR}/libs/:

