#!/usr/bin/env bash

trap ctrl_c INT
function ctrl_c() {
  echo "** Trapped CTRL-C"
  exit 1
}

BREW_COMMAND="$(which brew)"
CASK_COMMAND="$BREW_COMMAND cask"
FAILED_ITEMS=""

function install_package() {
  echo EXECUTING: brew install $1 $2
  $BREW_COMMAND install $1 $2
  [ $? -ne 0 ] && $FAILED_ITEMS="$FAILED_ITEMS $1"  # package failed to install.
}

function install_cask_package() {
  echo EXECUTING: brew cask install $1
  $CASK_COMMAND install $1
  [ $? -ne 0 ] && $FAILED_ITEMS="$FAILED_ITEMS $1"  # package failed to install.
}

/usr/local/bin/brew tap caskroom/cask
/usr/local/bin/brew tap homebrew/core
/usr/local/bin/brew tap homebrew/php
/usr/local/bin/brew tap homebrew/services
/usr/local/bin/brew tap keith/formulae
install_package ack ''
install_package autoconf ''
install_package automake ''
install_package bcrypt ''
install_package ccrypt ''
install_package dirmngr ''
install_package exiftool ''
install_package ffmpeg ''
install_package freetype ''
install_package gdbm ''
install_package gettext ''
install_package gmp ''
install_package gnu-sed ''
install_package gnupg2 ''
install_package go ''
install_package gpg-agent ''
install_package httpie ''
install_package hugo ''
install_package icdiff ''
install_package icu4c ''
install_package igbinary ''
install_package jpeg ''
install_package lame ''
install_package libassuan ''
install_package libevent ''
install_package libgcrypt ''
install_package libgpg-error ''
install_package libksba ''
install_package libmemcached ''
install_package libpng ''
install_package libsass ''
install_package libtool ''
install_package libusb ''
install_package libusb-compat ''
install_package libvo-aacenc ''
install_package libxml2 ''
install_package lynx ''
install_package mackup ''
install_package makedepend ''
install_package mcrypt ''
install_package memcached ''
install_package mhash ''
install_package mongodb ''
install_package nmap ''
install_package openssl ''
install_package pandoc ''
install_package phing ''
install_package php56 ''
install_package php56-igbinary ''
install_package php56-intl ''
install_package php56-mcrypt ''
install_package php56-memcached ''
install_package php56-mongodb ''
install_package php56-redis ''
install_package pinentry ''
install_package pkg-config ''
install_package pth ''
install_package pv ''
install_package python3 ''
install_package readline ''
install_package redis ''
install_package reminders-cli ''
install_package sassc ''
install_package scrypt ''
install_package sqlite ''
install_package unixodbc ''
install_package wget ''
install_package x264 ''
install_package xvid ''
install_package xz ''
install_package youtube-dl ''
[ ! -z $FAILED_ITEMS ] && echo The following items were failed to install: && echo $FAILED_ITEMS
