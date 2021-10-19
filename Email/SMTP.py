# -*- coding:utf-8 -*-

from email.mime.text import MIMEText
from email.header import Header
from email.utils import parseaddr, formataddr

def _format_addr(s):
    name, addr = parseaddr(s)
    return formataddr((Header(name, 'utf-8').encode(), addr))

# input email and passwd
from_addr = input('From: ')
password = input('password: ')
to_addr = input('To: ')

# input SMTP server address
smtp_server = input('SMTP server: ')

# plain text email
msg = MIMEText("hello, send by Python...", 'Plain', 'utf-8')
msg['From'] = _format_addr('暗之恶魔 <%s>' % from_addr) # 发件人
msg['To'] = _format_addr('光之使者 <%s>' % to_addr) # 收件人
msg['Subject'] = Header("接受地狱的审判吧！", 'utf-8').encode() # 主题

# send to MTA
import smtplib
server = smtplib.SMTP(smtp_server, 25)
server.starttls()
server.set_debuglevel(1) # print interactive info with the server
server.login(from_addr, password)
server.sendmail(from_addr, [to_addr], msg.as_string())
server.quit()