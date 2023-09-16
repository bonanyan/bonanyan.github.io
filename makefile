default:
	bundle install
	bundle exec jekyll serve --lsi

push:
	git add .
	git status
	git commit -m "update"
	git push
