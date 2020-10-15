FROM java:8
MAINTAINER m.martin.huvelle@gmail.com
WORKDIR /musicBot
ARG MVERSION
ENV VERSION=${MVERSION}
RUN mkdir conf && wget -q https://github.com/jagrosh/MusicBot/blob/${VERSION}/src/main/resources/reference.conf -O conf/config.txt
RUN wget -q https://github.com/jagrosh/MusicBot/releases/download/${VERSION}/JMusicBot-${VERSION}.jar
CMD java -Dnogui=true -Dconfig=/musicBot/conf/config.txt -jar JMusicBot-${VERSION}.jar
