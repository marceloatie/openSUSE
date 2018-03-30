#!/bin/sh

zypper in nginx
systemctl enable nginx
systemctl start nginx
