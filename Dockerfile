FROM ubuntu:latest

ADD *.sh /

RUN chmod +x ./fetchTags.sh
RUN apt update && apt install git -y

ENTRYPOINT ["/fetchTags.sh"]
