#Manage email using getmail, procmail, msmtp, and mutt

getmail: used to retrieve emails from the mail servers  
procmail: used to be autonomous mail processor (filter emails retrieved via getmail)  
msmtp: used to send mail   
mutt: used to be Mail User Agent  
Following below steps to accomplish the mail related environment:

*note: I use the __Ubuntu 14.04__ Linux Distribution, therefor
I am able to easy install sofeware via Package Management System such as
`apt-get install` as apposed to install software by compiling from the source
code.*

###Installing prerequisites

1. create related mail along with your email accounts folders:
   - `cd` 
   - `mkdir -m 700 -p mail/kevin4fly_gmail/{bank,beyondsoft,default,linkedin,promotion,social,draft,inbox,sent}/{cur,new,tmp}`   
   - `mkdir -m 700 -p mail/kevin4fly_sina/{default,draft,inbox,sent}/{cur,new,tmp}`
2. create log directory:
   - `cd`
   - `mkdir -m 700 log`
2. install getmail: `sudo apt-get install getmail4`
3. install procmail: `sudo apt-get install procmail`
4. install msmtp and certificates: `sudo apt-get install msmtp ca-certificates`
5. install mutt related: `mutt-patched muttprint urlview gv w3m`

###Configure
1. clone the getmail and msmtp rcfile from github
   - `git clone https://gist.github.com/4a2c2ac9e8c97f4f5997.git mailrc`
   - `cd mailrc`
   - `cp msmtprc ~/.msmtprc`
   - `mkdir ~/.getmail`
   - `cp getmailrc kevin4fly.gmail kevin4fly.sina get_mail.sh ~/.getmail/`
2. change the password for the related email accounts, including: `~/.getmail/getmailrc|kevin4fly.gmail|kevin4fly.sina``~/.msmtprc`
3. use `crontab -e` to obtain emails automatically. open ~/.getmail/get_mail.sh to view the template.
