## Build Plugin
##
##

NAME = wp-network

# Default Install Action
default:
	make install

# Build for Distribution
build:
	echo Building $(NAME).
	npm install --production
	composer install --prefer-dist --no-dev --no-interaction
	grunt build

# Build for repository commit
push:
	echo Pushing $(NAME).
	rm -rf composer.lock
	composer update --prefer-dist --no-dev --no-interaction
	git add . --all
	git commit -m '[ci skip]'
	git push

# Build for repository commit
clean:
	echo Cleaning $(NAME).
	rm -rf composer.lock
	rm -rf ./vendor/**
	rm -rf ./node_modules

# Install for Staging/Development
install:
	echo Installing $(NAME).
	composer update --prefer-dist --no-dev --no-interaction
