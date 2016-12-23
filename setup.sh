#! /bin/bash

backup_folder="$(readlink -m backup)"

mkdir -p "$backup_folder"

confirm_create_link () {
	file_path="$1"
	if [ -f "$file_path" ]
	then
		echo -n  "File '$file_path' already exists, overwrite? [Y/N] "
		read r
		if [[ "$r" =~ ^[Yy]$ ]]
		then
			mv "$file_path" "$backup_folder"
			return 0
		else
			return 1
		fi
	fi
	return 0
}

create_soft_link () {
	target="$1"
	link_name="$2"

	if [ -z "$target" ] || [ -z "$link_name" ]
	then
		echo "$0: empty arg given \$target='$target' \$link_name='$link_name'"
		return
	fi


	target="$(readlink -m $target)"
	link_name="$(readlink -m $link_name)"

	if [ ! -f "$target" ] || [ "$target" == "$link_name" ]
	then return 1
	fi


	if confirm_create_link "$link_name"
	then
		ln -s "$target" "$link_name"
	else
		echo "skipping '$link_name'"
	fi
}

make_bash_links () {
	#echo "making bash links"
	create_soft_link ".bash_aliases" "$HOME/.bash_aliases"
	create_soft_link ".bashrc" "$HOME/.bashrc"
}

make_vim_links () {
	#echo "making vim links"
	create_soft_link ".vimrc" "$HOME/.vimrc"
	create_soft_link ".vim" "$HOME/.vim"
}

make_xfce_links () {
	#echo "making xfce links"
	create_soft_link "xfce4/terminal" "$HOME/.config/xfce4/terminal"
}

make_Xmodmap_link () {
	#echo "making Xmodmap link"
	create_soft_link ".Xmodmap" "$HOME/.Xmodmap"
}

make_git_link () {
	#echo "making git link"
	create_soft_link ".gitconfig" "$HOME/.gitconfig"
}

make_links () {
	create_backup_folder
	make_bash_links
	make_vim_links
	make_xfce_links
	make_Xmodmap_link
	make_git_link
}

make_links
