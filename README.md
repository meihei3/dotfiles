# セットアップ

- [ ] dotfiles のインストール `curl -L raw.github.com/meihei3/dotfiles/master/install.sh | bash`
- [ ] アプリケーションを入れる( [./Apps/README.md](./Apps/README.md) )
- [ ] Homebrew の設定( [./Homebrew/README.md](./Homebrew/README.md) )
- [ ] fish の設定( [./Fish/README.md](./Fish/README.md) )
- [ ] Git の設定
- [ ] phpbrew の設定
- [ ] nodebrew の設定
- [ ] スクショ保存場所を設定

## ssh

```
mkdir ~/.ssh
```

### Git

https://qiita.com/shizuma/items/2b2f873a0034839e47ce

```
$ ssh-keygen -t ed25519 -P "" -f id_github_ed25519
```

名前は`id_github_ed25519`

https://github.com/settings/ssh 鍵のアップロード

ssh の設定

```
Host github.com
  HostName github.com
  IdentityFile ~/.ssh/id_github_ed25519
  User git
```

確認

```
$ ssh -T git@github.com
```

```
$ git config --global core.editor vim
$ git config --global user.email "24579635+meihei3@users.noreply.github.com"
$ git config --global user.name "meihei3"
```

## phpbrew

https://qiita.com/ayataka555/items/15d7fc53b7e34289f925

```
$ curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
$ chmod +x phpbrew
$ mv phpbrew /usr/local/bin/phpbrew
$ phpbrew init
```

## nodebrew

https://qiita.com/mame_daifuku/items/373daf5f49ee585ea498

```
$ nodebrew setup
$ nodebrew install-binary v12.20.1
```

## スクショ保存場所

```
defaults write com.apple.screencapture location ~/Pictures/screenshots/; killall SystemUIServer
```
