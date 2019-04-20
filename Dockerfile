FROM beevelop/ionic

RUN apt-get update

# PhantomJs
RUN apt-get install -y build-essential chrpath libssl-dev libxft-dev
RUN apt-get install -y libfreetype6 libfreetype6-dev
RUN apt-get install -y libfontconfig1 libfontconfig1-dev

RUN mkdir -pv $ANDROID_HOME/licenses
RUN (echo; echo -n 24333f8a63b6825ea9c5514f83c2829b004d1fee) >> $ANDROID_HOME/licenses/android-sdk-license
RUN $ANDROID_HOME/tools/bin/sdkmanager 'build-tools;28.0.3'

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update
RUN apt-get install -y google-chrome-stable
