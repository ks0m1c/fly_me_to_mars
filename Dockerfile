FROM alpine:latest
MAINTAINER ks0m1c_m0rpʒus <john@doe.com>

EXPOSE 80/tcp
EXPOSE 34343/udp

COPY ./bin/start-urbit.sh /bin/start-urbit
COPY ./bin/get-urbit-code.sh /bin/get-urbit-code
COPY ./bin/reset-urbit-code.sh /bin/reset-urbit-code

RUN apk add --no-cache curl bash libcap libc6-compat tar
RUN cd /bin && curl -L https://urbit.org/install/linux-x86_64/latest | tar xzk --transform='s/.*/urbit/g'
RUN chmod +x /bin/urbit
RUN setcap 'cap_net_bind_service=+ep' /bin/urbit

RUN mkdir -p /urbit
RUN mkdir -p /tmp
WORKDIR /urbit

COPY . .

CMD if [[ ! -z "$SWAP" ]]; then fallocate -l $(($(stat -f -c "(%a*%s/10)*7" .))) _swapfile && mkswap _swapfile && swapon _swapfile && ls -hla; fi; free -m; bash /bin/start-urbit
#ENTRYPOINT ["tail", "-f", "/dev/null"]
