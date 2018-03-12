h1.  conversation

* SpeechRec operation verification

h2. Setup procedure

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

h2. How to use

# Switching to Python 2.7 environment
<pre>
# scl enable python27 bash
</pre>
# Program execution
<pre>
# ./speaker.sh
</pre>

h2. Rough Process flow

# recording
# Text recorded the recorded sound
# Extract corresponding answer
# Audio file creation
# Play audio file

h2. Note

* Three COREVO-API libraries are registered with conversation/libs/
** ※AsrTestDriver.shでここにパスを通してる
> export LD_LIBRARY_PATH=${CURRENT_DIR}/libs/:

