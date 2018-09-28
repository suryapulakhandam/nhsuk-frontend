FROM node:8.12.0-alpine

RUN apk add bash


ENV USERNAME nodeuser

RUN adduser -D $USERNAME && \
    mkdir /nhsuk-frontend && \
    chown $USERNAME:$USERNAME /nhsuk-frontend

USER $USERNAME

WORKDIR /nhsuk-frontend

EXPOSE 3000

COPY . /nhsuk-frontend

# COPY will copy over files as a root user, so we need to change the owner.
USER root
RUN find /nhsuk-frontend -user 0 -print0 | xargs -0 chown $USERNAME:$USERNAME
USER $USERNAME

RUN npm install

CMD npm start
