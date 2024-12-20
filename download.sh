#!/usr/bin/env bash
set -xeuo pipefail

rm -rf tmp
mkdir -p tmp/download
mkdir -p tmp/prebuilt

# task --list-all | sed -e 's/://g' -e 's/*//g'
pkgs=(
  aria2
  atuin
  autoconf
  automake
  bash
  bat
  bazelisk_patched
  binutils
  bison
  bzip2
  connect
  coreutils
  croc_patched
  curl
  diffutils_patched
  ethtool
  eza
  fd
  file
  findutils
  flex
  # fzf
  fzf_patched
  # gdb
  gdu_patched
  gettext
  gh_patched
  git
  git-absorb
  git-extras
  # git-lfs
  git_lfs_patched
  glibcLocales
  gnugrep
  gnumake
  gnupatch
  gnupg_minimal_patched
  gnused
  gnutar
  # go-task
  go_task_patched
  # gost
  gost_patched
  gzip
  inetutils
  iproute2
  iptables
  iputils
  jq
  krb5
  less
  libcap
  libtool
  # llvmPackages_18.clang-unwrapped
  lsb-release
  lsof
  m4
  man
  miniserve
  ncdu_1
  netcat
  nettools
  ninja
  # nixfmt-rfc-style
  nixpkgs-fmt
  numactl
  openssh_gssapi
  openssl
  patchelf
  perl
  pkg-config
  procps
  procs
  protobuf_24
  protobuf_25
  protobuf_28
  protobuf_3_8_0_patched
  protobuf_3_9_2_patched
  python311_patched
  rsync
  ruff
  # setup
  # setup-extra
  # shfmt
  shfmt_patched
  # silver-searcher
  silver_searcher_patched
  snappy
  starship
  strace
  tmux
  tree
  tzdata
  unzip
  util-linux
  vim
  wget
  xxd
  xz
  zip
  zlib
  zlib-ng
  # zsh
  zsh_patched
  zstd
)
for pkg in "${pkgs[@]}"; do
  curl -sSL -o tmp/download/${pkg}.tar.gz https://github.com/curoky/prebuilt/releases/download/v1.0/${pkg}.linux_amd64.tar.gz &
done

# mkdir tmp/prebuilt

wait

for pkg in "${pkgs[@]}"; do
  mkdir -p tmp/prebuilt/${pkg}
  tar -xv --gunzip -f tmp/download/${pkg}.tar.gz -C tmp/prebuilt/${pkg} --strip-components 2
done

# wget https://github.com/curoky/prebuilt/releases/download/v1.0/aria2.darwin_arm64.tar.gz
