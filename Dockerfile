# To minimize the fetching of various layers this image and tag should
# be used as the base of the bhsm container in boulder/docker-compose.yml
FROM letsencrypt/boulder-tools-go1.10.2:2018-05-25

# Boulder exposes its web application at port TCP 4000 and 4001
EXPOSE 4000 4001 4002 4003 4430 4431 8053 8055

ENV PATH /usr/local/go/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/
ENV GOPATH /go

WORKDIR /go/src/github.com/letsencrypt/boulder
COPY . ./

ENTRYPOINT [ "./test/entrypoint.sh" ]
