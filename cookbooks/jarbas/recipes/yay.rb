#
# Cookbook:: jarbas
# Recipe:: yay
#
# Copyright:: 2022, The Authors, All Rights Reserved.

#HACK: Fix for kitchen failing to install yay if pacman db not up to date
#      This shouldn't be needed here but `intermediate_instructions` in kitchen doesnt seem to be working

jarbas_package 'yay'
