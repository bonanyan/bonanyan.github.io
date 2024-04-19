default:
	bundle install
	bundle exec jekyll serve --lsi

build:
	rm -rf docs
	mkdir docs
	echo bonany.cc > docs/CNAME
	jekyll build --destination docs	

push:
	git add .
	git status
	git commit -m "update"
	git push
