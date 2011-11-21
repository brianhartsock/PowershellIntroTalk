# Powershell Intro

Code Camp tutorial on Powershell.

## Goal
* To have a basic understanding of Powershell and be able to sit down at a console and write your own script.

## Questions
* Who has used powershell?
* What is it?
* Who hasn't used it?
* Who has used UNIX?

## Purpose
* Windows Automation engine
* Foundation of new Server Technologies
* Easy automation of repetitive task
* Full fledge shell and language

## Basic shell
* Should be able to do everything in normal command prompt
* dir, cd, ipconfig, notepad
* ls, cd, ps, cat!!

## What's different
* A lot!
* Cmdlet's and Pipeline

## cmd-lets
* CORE of Powershell
* First cmdlet get-command
* Consistent name scheme (Verb-Noun)
* Standard format for parameters
* -Verb? oops, try get-help

## get-help
* get-help get-command

## get-command
* Verb takes string[]
* get-command -verb get
* get-command -verb get,start

## Pipeline
* Standard output
* Is it just string output?
* It is output to a pipeline...
* ls | out-default
* ls | format-table
* ls | format-list
* get-command -verb start
* get-command -verb start | format-list
* get-command -verb start | gm

## Objects!!!
* Variables
* get-date
* get-date | gm
* $date = get-date
* $date | gm
* $date.adddays(5)
* $date.second
* $second = $date.second
* $second | gm
* $second = "asdf"
* LOOSLY TYPED
* CASE INSENSITIVE

## Basic structures
* if/else
* for
* foreach

## Basic to Pipeline
* where
* foreach

## Examples
* Math Problem
* get-tweets
* update-status


## Tab completion?
