FROM node:latest

RUN apt-get update -y
RUN apt-get upgrade -y
RUN mkdir parse

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /parse && cp -a /tmp/node_modules /parse/

ADD . /parse
WORKDIR /parse

EXPOSE 1337

# Uncomment if you want to access cloud code outside of your container
# A main.js file must be present, if not Parse will not start

# VOLUME /parse/cloud

CMD [ "npm", "start" ]
