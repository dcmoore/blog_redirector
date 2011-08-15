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

arr_of_old_paths=( "articles/2011/6/23/type-camp-california-day-two-recap" "articles/2011/6/20/type-camp-california-day-one-recap" "articles/2011/6/11/winning-at-consistency" )
arr_of_new_paths=( "http://8thlight.github.com/billy-whited/2011/06/23/type-camp-california-day-2.html" "http://8thlight.github.com/billy-whited/2011/06/20/type-camp-california-day-1.html" "http://8thlight.github.com/colin-jones/2011/06/10/winning-at-consistency.html")
i=0

for arr_of_old_paths in ${arr_of_old_paths[@]}
do
	make_new_directory_and_add_redirect $arr_of_old_paths ${arr_of_new_paths[$i]}
	i=`expr $i + 1`
done