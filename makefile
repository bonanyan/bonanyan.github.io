default:
	bundle install
	bundle exec jekyll serve --lsi

build:
	rm -rf docs
	jekyll build --destination docs	

push:
	git add .
	git status
	git commit -m "update"
	git push
