#!/bin/bash

failed_items=""
function install_package() {
echo EXECUTING: brew install $1 $2
brew install $1 $2
[ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.
}
brew tap caskroom/cask
install_package ack ''
install_package autoconf ''
install_package automake ''
install_package bcrypt ''
install_package brew-cask ''
install_package ccrypt ''
install_package cheat ''
install_package dirmngr ''
install_package ffmpeg ''
install_package gmp ''
install_package gnupg2 ''
install_package go ''
install_package gpg-agent ''
install_package httpie ''
install_package icdiff ''
install_package lame ''
install_package libassuan ''
install_package libgcrypt ''
install_package libgpg-error ''
install_package libksba ''
install_package libsass ''
install_package libtool ''
install_package libusb ''
install_package libusb-compat ''
install_package libvo-aacenc ''
install_package lynx ''
install_package makedepend ''
install_package nmap ''
install_package openssl ''
install_package pandoc ''
install_package pinentry ''
install_package pkg-config ''
install_package pth ''
install_package pv ''
install_package redis ''
install_package sassc ''
install_package scrypt ''
install_package wget ''
install_package x264 ''
install_package xvid ''
install_package xz ''
install_package youtube-dl ''
[ ! -z $failed_items ] && echo The following items were failed to install: && echo $failed_items
