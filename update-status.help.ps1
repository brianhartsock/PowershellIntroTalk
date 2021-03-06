# update-status.ps1
# 
# Usage: update-status.ps1 "I am posting this from a Powershell Twitter client"# 
# Usage: update-status.ps1 "I am posting this from a Powershell Twitter client" -whatif 
#
# Posts status to twitter.  WhatIf switch used to show what it is going to do instead of always posting.
# http://twitter.com/statuses/update.xml

param
(
    [string] $status,
    [switch] $whatif
)

#Validate Status
if(!$status){
    throw "Please enter a status"
}

#Expect 100 Continue...
[System.Net.ServicePointManager]::Expect100Continue = 0

#Use System.Web.HttpUtility to urlencode the status
[System.Reflection.Assembly]::LoadWithPartialName("System.Web") | out-null 
$status = [System.Web.HttpUtility]::UrlEncode($status)

#Create web client and set auth header
$client = new-object net.webclient
$client.headers["Authorization"] = "Basic " + (gc auth.txt)
$client.encoding = [System.Text.Encoding]::UTF8

#Upload string
if($whatif){
    "POST http://twitter.com/statuses/update.xml status=$status"
}else{
    ([xml] $client.uploadstring("http://twitter.com/statuses/update.xml", "status=$status"))
}