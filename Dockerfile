# base image
FROM node:10.14.0

# # install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH
ENV CHROME_BIN=/usr/bin/google-google-chrome-stable


WORKDIR /usr/src/app
COPY package.json ./package.json
RUN npm install
RUN npm install @angular/cli
COPY . .

CMD ng serve  --host
