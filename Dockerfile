FROM debian:bookworm

RUN apt update && apt upgrade -y
RUN apt install -y curl neofetch docker nano docker-compose xterm wget htop && curl -sSLo gotty https://raw.githubusercontent.com/afnan007a/Replit-Vm/main/gotty
RUN chmod +x gotty && mv gotty /usr/bin/
ENV TERM=xterm
WORKDIR /root
EXPOSE 80 433 800
CMD gotty -p 800 -w bash
