setup: install

install:
	bundle install

lint:
	bundle exec rubocop .

lint-fix:
	bundle exec rubocop -A .

test:
	rake test

.PHONY: test
