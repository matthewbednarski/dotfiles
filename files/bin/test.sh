#!/bin/bash


token=fbdf34c3a17746726b7dbea29cf36ffb211ab927
public=true
remote="$(echo "$public" | jq '{ public: ., files: { _: { content: "_" } } }'\
	| curl -fnX POST -H "Authorization: token $token" -d @- https://api.github.com/gists )" 
echo "$remote"
echo "gisted: $(echo "$remote" | sed 's/\.git$//')"
