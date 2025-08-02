#!/usr/bin/bash
cd /path/elixir-data/linux/repo
git fetch -a
cd /usr/local/elixir
nohup ./update.py&
