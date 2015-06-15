#!/bin/bash
#
# images2md.sh ver. 0.1 by inutano
#   convert images exported from keynote slides to markdown
#
# usage
#  ./images2md.sh <target directory of images exported from keynote>
#

# set variables
target_dir=${1}
dirname=`echo ${target_dir} | awk -F '/' '{ print $NF }'`

# make new directory and copy images to be uploaded to github
markdown_dir="./${dirname}-markdown"
mkdir ${markdown_dir}
cp ${target_dir}/* ${markdown_dir}

# create simple markdown file employ images named readme.md
cd ${markdown_dir}
ls | awk '{ print "![" $0 "](" $0 ")\n---\n" }' > ./README.md
