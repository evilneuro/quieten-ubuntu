# quieten-ubuntu
`quieten.sh` is a script to perform common rollback configs to quieten down an installation of Ubuntu Server. [Download the bash script](quieten.sh), review it, then run it as `root` or using `sudo`, e.g.:

```
$ wget https://github.com/evilneuro/quieten-ubuntu/raw/main/quieten.sh
$ sudo ./quieten.sh
```

## What does it do?
It applies some configuration changes to quiet down Ubuntu Server. It tries to be non-destructive, either by using existing tools to make modifications, or to change permissions or filenames of configuration or script files, rather than delete anything.

## But why does Ubuntu Server need to be quiet?
Canonical, the corporate owner of the Ubuntu Linux distribution and related open source project, have, over the years, increased the number of marketing messages that end-users are exposed to.

This is perfectly normal behaviour for a company trying to upsell it's commercial products and remain profitable, so that it can continue development of its products; this is especially normal behaviour for a company that doesn't charge for its core product: in this case, Ubuntu Linux.

However, when this gets in the way of core use cases for their software, i.e., the automation of software package installation and updates on headless servers or virtual machines, then it becomes at best, pesky, or at worst, damaging.

Specifically, these have included messages promoting their support services [Ubuntu Advantage](https://ubuntu.com/blog/tag/ubuntu-advantage), [Ubuntu Pro](https://ubuntu.com/pro), and their gatekeeping of the [`universe` package repository](https://help.ubuntu.com/community/Repositories/Ubuntu) behind [Expanded Security Maintenance](https://ubuntu.com/security/esm) (ESM). These messages have been delivered in several ways, including in the Message of the Day (MOTD) shown on login via console or SSH, and during package repository updates and package installation, even [being displayed](https://www.reddit.com/r/Ubuntu/comments/xxafiu/comment/isnzhf5/) when the commands being executed are using flags such as `-qqq` to reduce command output to a minimum or to zero.

## What if I like the marketing messages, or other notifications?
That's OK. Either don't run this script, or modify it to suit your needs or preferences; the comments should make it clear what's being disabled, and why.

## Why Ubuntu Server and not Ubuntu Desktop or [insert Ubuntu variant here]
Because in desktop versions of Ubuntu, the marketing messages are normally not obtrusive to the end-user, nor detrimental to normal and expected operation of the computer.

## Do you not want Canonical to be profitable?
Of course I do. But the beauty of open systems and open source means that we can make whatever changes we like, within the constraints of the licence that the software is delivered and used under, and in this case *it's fine*.

## Who are you to [insert angriness here]
I've been using UNIX since 1993, and I've been a UNIX sysadmin by trade since 1996. [I've worked with](https://www.reddit.com/r/ProgrammerHumor/comments/3mun55/evolution_of_linux_neckbeardsxpost/) Yggdrasil, Slackware, Debian, RHEL, CentOS, Gentoo, and SUSE over the years, and I started using Ubuntu Linux with the Ubuntu 4.10 *Warty Warthog* release, i.e., when Ubuntu was first publicly released. And since I'm a sysadmin, I like fixing things in a distribution when they aren't to my liking. This is why config files, [`sources.list`](https://manpages.ubuntu.com/manpages/jammy/man5/sources.list.5.html), [PPAs](https://launchpad.net/ubuntu/+ppas), and [`apt` pinning](https://gist.github.com/JPvRiel/8ae81e21ce6397a0502fedddca068507) are things, and this script is just one more thing to tweak things. And I thought I'd share, since I know I'm not alone!

## You missed a spot
Whoops! [Open a pull request](/pulls) and help out! Thanks!

## Hat tips
* [What are the services 'apt-news' and 'esm-cache', and how do I disable them?](https://askubuntu.com/questions/1452519/what-are-the-services-apt-news-and-esm-cache-and-how-do-i-disable-them)
* [Ask Ubuntu: What is meant by 'APT News'?](https://askubuntu.com/questions/1441035/what-is-meant-by-apt-news/)
* [How to list all enabled services from systemctl?](https://askubuntu.com/questions/795226/how-to-list-all-enabled-services-from-systemctl)
* [How to disable the advertisements when sshing into an Ubuntu machine](https://askubuntu.com/questions/1083504/how-to-disable-the-advertisements-when-sshing-into-an-ubuntu-machine)