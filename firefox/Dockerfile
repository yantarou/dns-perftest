FROM "debian:buster-slim"

RUN apt-get update
RUN apt-get install --yes --no-install-recommends firefox-esr
RUN rm -rf /var/lib/apt

ENTRYPOINT [ "/usr/bin/firefox-esr" ]
RUN echo 'pref("browser.feeds.showFirstRunUI", false);' >> /etc/firefox-esr/pref.js
RUN echo 'pref("browser.rights.3.shown", true);' >> /etc/firefox-esr/pref.js
RUN echo 'pref("browser.startup.homepage", "");' >> /etc/firefox-esr/pref.js
RUN echo 'pref("datareporting.policy.firstRunURL", "");' >> /etc/firefox-esr/pref.js
RUN echo 'pref("startup.homepage_welcome_url", "");' >> /etc/firefox-esr/pref.js
