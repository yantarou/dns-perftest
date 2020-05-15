FROM "debian:buster-slim"

RUN apt-get update
RUN apt-get install --yes --no-install-recommends ca-certificates gnupg wget
RUN wget -O - https://pkg.dns-oarc.net/dns-oarc.distribution.key.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add -
RUN echo "deb http://pkg.dns-oarc.net/debian buster main" > /etc/apt/sources.list.d/dns-oarc.list
RUN apt-get update
RUN apt-get install --yes --no-install-recommends dnsmeter
RUN rm -rf /var/lib/apt

ENTRYPOINT [ "/usr/bin/dnsmeter" ]
