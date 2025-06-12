# dotfiles

My personal dotfiles.

## Setup on New Machine

1. Add the dotfiles alias to your shell:

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

2. Clone the repository as a bare repo:

```bash
git clone --bare https://github.com/IsaacCheng9/dotfiles.git $HOME/.dotfiles
```

3. Checkout the files (if this fails due to existing files, see below):

```bash
dotfiles checkout
```

If checkout fails due to existing config files, back them up and try again:

```bash
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} {}.backup
dotfiles checkout
```

4. Set the repository to not show untracked files:

```bash
dotfiles config --local status.showUntrackedFiles no
```
