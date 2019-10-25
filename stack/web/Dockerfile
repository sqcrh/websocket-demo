FROM ubuntu

# install tools
RUN apt-get update -qq && apt-get install -y \
	sudo \
	nano \
	postgresql-client \
	curl \
	git

# install node
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get update -qq && apt-get install -y \
	nodejs

# install vue-cli
RUN npm install -g @vue/cli
RUN npm install -g @vue/cli-init

# install python
RUN apt-get update -qq && apt-get install -y \
	python3-pip

# install python requirements
RUN pip3 install requests python-socketio aiohttp

# copy enter script
COPY stack/web/enter.sh enter.sh

# make app directory working dir
RUN mkdir app
WORKDIR app

EXPOSE 3000
CMD ["tail", "-f", "/dev/null"]
# rails server -b '0.0.0.0'"
# yarn && ./bin webpack_dev_server
