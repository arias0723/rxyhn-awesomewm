#!/bin/bash

FS_CONFIG_DIR="$HOME/.config"
GIT_CONFIG_DIR="./config"

dir_names=("awesome")

for dir_name in ${dir_names[@]}; do
	config_dir="$FS_CONFIG_DIR/$dir_name"
	config_files_in_dir=$(find $config_dir -type f -exec realpath --relative-to $FS_CONFIG_DIR {} \;)

	# hard link to 'real' cfg files
	for cfg_file in $config_files_in_dir; do
		fs_cfg_file="$FS_CONFIG_DIR/$cfg_file"		
		git_cfg_file="$GIT_CONFIG_DIR/$cfg_file"
		#echo $fs_cfg_file
		#echo $git_cfg_file
		ln -f $fs_cfg_file $git_cfg_file
	done
done
