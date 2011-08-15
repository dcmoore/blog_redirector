#!/bin/sh

# $1 = path to direct to
print_redirect_script()
{
	echo "<html><head><meta http-equiv=\"Refresh\" content=\"2;url=$1\" /></head><body><p>This post has moved. Now directing you to the new site. If you are not redirected in the next 5 seconds, please click <a href =\"$1\">here</a></p></body></html>"
}

# $1 = old path  $2 = new path
make_new_directory_and_add_redirect()
{
	mkdir -p $1
	cd $1
	print_redirect_script $2 > index.html
	cd "../../../../../"
}
